import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  const CustomTextField({super.key,required this.hintText, this.minLines = 1, this.onSaved, this.onChanged, this.controller,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
      minLines: minLines,
      maxLines:maxLines,
      cursorColor: ColorsManager.primary,
      decoration: InputDecoration(
        hintText: hintText,

      ),
    );
  }

  OutlineInputBorder buildBorder({ Color color = Colors.white}) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 1.5,color: color),
        borderRadius: BorderRadius.circular(12),
      );
  }
}