// service locater == Dependency Injection

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/features/home/data/data_source/local_data_source.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/add_note_use_case.dart';

final getit = GetIt.instance;

void setupServiceLocator() {

  getit.registerSingleton<AddNoteUseCase>(AddNoteUseCase(
            homeRepo: HomeRepoImpl(
              localDataSource: LocalDataSourceImpl(
                notesBox: Hive.box<NoteModel>(ConstantsManager.notesBox),
              ),
            ),
          ),);
  }
