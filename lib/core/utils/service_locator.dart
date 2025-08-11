// service locater == Dependency Injection

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/features/home/data/data_source/local_data_source.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/add_note_use_case.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/get_notes_use_case.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/update_note_use_case.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  // Hive
  getit.registerSingleton<Box<NoteModel>>(Hive.box<NoteModel>(ConstantsManager.notesBox));
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
              localDataSource: LocalDataSourceImpl(
                notesBox :getit.get<Box<NoteModel>>()
              ),
            ));

  getit.registerSingleton<AddNoteUseCase>(AddNoteUseCase(
            homeRepo: getit.get<HomeRepoImpl>(),
          ),);

  getit.registerSingleton<GetNotesUseCase>(GetNotesUseCase(
            homeRepo: getit.get<HomeRepoImpl>(),
          ),);

  getit.registerSingleton<UpdateNoteUseCase>(UpdateNoteUseCase(
            homeRepo: getit.get<HomeRepoImpl>(),
          ),);
  }


