import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/core/extensions/reponsive_extensions.dart';
import 'package:notes_app_clean_arch/core/extensions/scroll_configuration_extension.dart';
import 'package:notes_app_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:notes_app_clean_arch/core/widgets/custom_loading_indicator.dart';
import 'package:notes_app_clean_arch/core/widgets/show_error_snack_bar.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/delete_note_cubit/delete_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/notes_list_view_disktop.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/notes_list_view_mobile.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  late GetNotesCubit getNotesCubit;
  late ScrollController scrollController;
  late bool _isLoadingMore;

  @override
  void initState() {
    getNotesCubit = BlocProvider.of<GetNotesCubit>(context);
    _isLoadingMore = false;
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() async {
    if (!_isLoadingMore &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * 0.9) {
      _isLoadingMore = true;

      await getNotesCubit.getAllNotes(
        pageNumber: getNotesCubit.currentPageIndex++,
      );
      _isLoadingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is DeleteNoteSuccess) {
          ShowCustomSnackBar.showError(
            context: context,
            message: 'The Note has been deleted successfully',
          );
        }
      },
      child: BlocBuilder<GetNotesCubit, GetNotesState>(
        builder: (context, state) {
          if (state is GetNotesSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                child: Visibility(
                  visible: context.deviceType == DeviceType.desktop,
                  replacement: NotesListViewMobile(notes: state.notes),
                  child: NotesListViewDisktop(notes: state.notes),
                ),
              ).withScrollConfiguration(),
            );
          } else if (state is GetNotesFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
