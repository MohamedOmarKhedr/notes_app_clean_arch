import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/text_style_manager.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => const EditNoteView(),));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom:12.0),
                  child: Text(note.title,style: TextStyleManager.noteTitleTextStyle,),
                ),
                textColor: Colors.black,
                iconColor: Colors.black,
                subtitle: Text(note.note, style: TextStyleManager.noteContentTitleTextStyle,),
                trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ),
            ),
            Align(alignment: Alignment.bottomRight, child: Padding(
              padding: const EdgeInsets.only(right:24),
              child: Text(note.date,style: TextStyleManager.noteHistoryTitleTextStyle,),
            )),
          ],
        ),
      ),
    );
  }
}
