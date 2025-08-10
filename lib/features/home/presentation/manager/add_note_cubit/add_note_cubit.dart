import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/add_note_use_case.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final AddNoteUseCase addNoteUseCase;
  AddNoteCubit(this.addNoteUseCase) : super(AddNoteInitial());

  Future<void> addNote({
    required String title,
    required String note,
    required String date,
    required int color,
  }) async {
    emit(AddNoteLoading());
    NoteModel noteModel = NoteModel(
      title: title,
      note: note,
      date: date,
      color: color,
    );

    var result = await addNoteUseCase.call(noteModel);
    result.fold(
      (failure) {
        emit(AddNoteFailure(errMessage: failure.errMessage));
      },
      (msg) {
        emit(AddNoteSuccess(msg: msg));
      },
    );
  }
}
