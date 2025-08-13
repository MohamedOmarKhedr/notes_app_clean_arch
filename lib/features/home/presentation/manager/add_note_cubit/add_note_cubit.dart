import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/add_note_use_case.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final AddNoteUseCase addNoteUseCase;
  AddNoteCubit(this.addNoteUseCase) : super(AddNoteInitial());

  Color currentColor = ColorsManager.color1;
  int currentIndex = 0 ;

  List<Color> colors = [
    ColorsManager.color1,
    ColorsManager.color2,
    ColorsManager.color3,
    ColorsManager.color4,
    ColorsManager.color5,
    ColorsManager.color6,
    ColorsManager.color7,
    ColorsManager.color8,
    ColorsManager.color9,
    ColorsManager.color10,
  ];

  Future<void> addNote({required NoteModel noteModel}) async {
    emit(AddNoteLoading());

    final result = await addNoteUseCase.call(noteModel);
    result.fold(
      (failure) {
        emit(AddNoteFailure(errMessage: failure.errMessage));
      },
      (msg) {
        emit(AddNoteSuccess());
      },
    );
  }

  void fetchCurrentIndex(int index){
    currentIndex = index;
    currentColor = colors[index];
    emit(FetchCurrentIndex());
  }
}
