import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/core/widgets/custom_error_widget.dart';
import 'package:notes_app_clean_arch/core/widgets/custom_loading_indicator.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/delete_note_cubit/delete_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is DeleteNoteSuccess) {
          BlocProvider.of<DeleteNoteCubit>(
            context,
          ).afterDeleteNoteSuccess(context);
        }
      },
      child: BlocBuilder<GetNotesCubit, GetNotesState>(
        builder: (context, state) {
          if (state is GetNotesSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
                  return NoteItem(note: state.notes[index]);
                },
              ),
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
