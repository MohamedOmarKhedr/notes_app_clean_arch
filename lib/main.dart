import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/core/utils/service_locator.dart';
import 'package:notes_app_clean_arch/core/utils/simple_bloc_obserrver.dart';
import 'package:notes_app_clean_arch/core/utils/theme_manager.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/get_notes_use_case.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/delete_note_cubit/delete_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/home_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserrver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(ConstantsManager.notesBox);
  setupServiceLocator();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return GetNotesCubit(getit.get<GetNotesUseCase>())..getAllNotes();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return DeleteNoteCubit(getit.get<Box<NoteModel>>());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeManager.getApplicationTheme(),
        home: const HomeView(),
      ),
    );
  }
}
