import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/core/utils/service_locator.dart';
import 'package:notes_app_clean_arch/core/widgets/show_error_snack_bar.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/add_note_use_case.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/add_note_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (BuildContext context) {
          return AddNoteCubit(
            getit.get<AddNoteUseCase>()
          );
        },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              ShowCustomSnackBar.showError(context: context, message: state.errMessage);
            } else if (state is AddNoteSuccess) {
              Navigator.pop(context);
              ShowCustomSnackBar.showSuccess(context: context, message: 'Add note successfully');
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading,
              child: SingleChildScrollView(child: const AddNoteForm()),
            );
          },
        ),
      ),
    );
  }
}
