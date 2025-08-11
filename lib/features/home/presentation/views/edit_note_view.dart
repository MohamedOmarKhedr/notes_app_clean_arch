import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;
  const EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: note,) ,
    );
  }
}