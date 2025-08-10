import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/core/utils/service_locator.dart';
import 'package:notes_app_clean_arch/core/utils/simple_bloc_obserrver.dart';
import 'package:notes_app_clean_arch/core/utils/theme_manager.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/add_note_use_case.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/home_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserrver();
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(ConstantsManager.notesBox);
  Hive.registerAdapter(NoteModelAdapter());
  setupServiceLocator();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AddNoteCubit(
          getit.get<AddNoteUseCase>()
        );
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeManager.getApplicationTheme(),
        home: const HomeView(),
      ),
    );
  }
}
