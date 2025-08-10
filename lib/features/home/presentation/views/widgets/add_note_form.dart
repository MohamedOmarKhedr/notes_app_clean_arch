import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_button.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, note;
  late AddNoteCubit addNoteCubit;
  @override
  void initState() {
    addNoteCubit = BlocProvider.of<AddNoteCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 12),
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 12),
          CustomTextField(
            hintText: 'Content Note',
            maxLines: 5,
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                var noteModel = NoteModel(
                  title: title ?? '',
                  note: note ?? '',
                  date: DateTime.now().toString(),
                  color: Colors.blue.toARGB32(),
                );
                addNoteCubit.addNote(noteModel: noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
