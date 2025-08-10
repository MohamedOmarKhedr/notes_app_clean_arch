import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_button.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12,),
            CustomTextField( hintText: 'Title',),
            SizedBox(height: 12,),
            CustomTextField( hintText: 'Content',maxLines: 5,),
            SizedBox(height: 30,),
            CustomButton(),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}