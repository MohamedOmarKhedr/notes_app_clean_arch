import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/text_style_manager.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom:12.0),
                child: Text('Flutter Tips',style: TextStyleManager.noteTitleTextStyle,),
              ),
              textColor: Colors.black,
              iconColor: Colors.black,
              subtitle: Text('Build Your Career With Us. Build Your Career With Us', style: TextStyleManager.noteContentTitleTextStyle,),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          ),
          Align(alignment: Alignment.bottomRight, child: Padding(
            padding: const EdgeInsets.only(right:24),
            child: Text('May 21,2022',style: TextStyleManager.noteHistoryTitleTextStyle,),
          )),
        ],
      ),
    );
  }
}
