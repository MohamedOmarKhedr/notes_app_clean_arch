import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/note_item.dart';

class NotesListViewDisktop extends StatelessWidget {
  final List<NoteModel> notes;
  

  const NotesListViewDisktop(
      {super.key, required this.notes,});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (notes.length + 1) ~/ 2, // نصف العناصر
            itemBuilder: (context, index) {
              final actualIndex = index * 2;
              if (actualIndex >= notes.length) return const SizedBox.shrink();
              return NoteItem(note: notes[actualIndex]);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (notes.length + 1) ~/ 2, // نصف العناصر
            itemBuilder: (context, index) {
              final actualIndex = index * 2 + 1;
              if (actualIndex >= notes.length) return const SizedBox.shrink();
              return NoteItem(note: notes[actualIndex]);
            },
          ),
        ),
      ],
    );
  }
}
