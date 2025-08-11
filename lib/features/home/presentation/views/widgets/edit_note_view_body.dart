import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/core/utils/strings_manager.dart';
import 'package:notes_app_clean_arch/core/widgets/show_error_snack_bar.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/update_note_cubit/update_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController titleController;
  late TextEditingController noteController;
  late String title;
  late String note;
  late UpdateNoteCubit updateNoteCubit;
  @override
  void initState() {
    title = widget.note.title;
    note = widget.note.note;
    titleController = TextEditingController(text: title);
    noteController = TextEditingController(text: note);
    updateNoteCubit = BlocProvider.of<UpdateNoteCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateNoteCubit, UpdateNoteState>(
      listener: (context, state) {
        if(state is UpdateNoteSuccess){
          updateNoteCubit.afterUpdateNoteSuccess(context);
        } else if (state is UpdateNoteFailure) {
          ShowCustomSnackBar.showError(
            context: context,
            message: state.errMessage,
          );
        }
      },
      child: Padding(
        padding: ConstantsManager.kAppPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              CustomAppBar(
                title: StringsManager.editNote,
                icon: Icons.check,
                onPressed: () {
                  NoteModel noteModel = NoteModel(
                    title: title,
                    note: note,
                    color: widget.note.color,
                    date: widget.note.date,
                    id: widget.note.key,
                  );
                  updateNoteCubit.updateNote(note: noteModel);
                },
              ),
              const SizedBox(height: 40),
              CustomTextField(
                hintText: 'Title',
                controller: titleController,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hintText: 'Note Content',
                controller: noteController,
                minLines: 5,
                onChanged: (value) {
                  note = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
