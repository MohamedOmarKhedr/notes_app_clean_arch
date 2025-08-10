import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditNoteViewBody() ,
    );
  }
}