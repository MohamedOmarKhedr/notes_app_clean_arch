import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/core/utils/strings_manager.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  ConstantsManager.kAppPadding,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomAppBar(title: StringsManager.editNote, icon: Icons.check,),
          const SizedBox(height: 40),
          CustomTextField(hintText: 'Title'),
          const SizedBox(height: 12),
          CustomTextField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
