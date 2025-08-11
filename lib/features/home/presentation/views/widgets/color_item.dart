import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isActive;
  const ColorItem({super.key, required this.color, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color,
        child: Visibility(
          visible: isActive,
          child: Icon(Icons.check, color: Colors.black, size: 30),
        ),
      ),
    );
  }
}
