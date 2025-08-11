import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';

class CustomSearchIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const CustomSearchIcon({super.key, required this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: ColorsManager.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          color: Colors.white,
          icon: Icon(icon, size: 28),
        ),
      ),
    );
  }
}
