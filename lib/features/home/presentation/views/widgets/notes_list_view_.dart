import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
        return const NoteItem();
      },),
    );
  }
}