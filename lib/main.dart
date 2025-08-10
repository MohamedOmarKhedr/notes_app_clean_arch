import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/core/utils/theme_manager.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(ConstantsManager.notesBox);
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

