import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/theme_manager.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeManager.getApplicationTheme(),
      home: const HomeView(),
    );
  }
}

