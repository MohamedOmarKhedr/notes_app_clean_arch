import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_button.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, note;

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
          CustomButton(onPressed:(){
            if(formKey.currentState!.validate()){
              formKey.currentState!.save();
            } else {
              autovalidateMode =AutovalidateMode.always;
            }

          }),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
