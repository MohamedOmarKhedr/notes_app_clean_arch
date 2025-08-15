import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/note_item.dart';

class NotesListViewMobile extends StatelessWidget {
  final List<NoteModel> notes;
  const NotesListViewMobile(
      {super.key, required this.notes,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return NoteItem(note: note);
      },
    );
  }
}
