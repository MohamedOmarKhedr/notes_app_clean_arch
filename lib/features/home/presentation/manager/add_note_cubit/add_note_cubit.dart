import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/add_note_use_case.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final AddNoteUseCase addNoteUseCase;
  AddNoteCubit(this.addNoteUseCase) : super(AddNoteInitial());

  Future<void> addNote({required NoteModel noteModel}) async {
    emit(AddNoteLoading());

    var result = await addNoteUseCase.call(noteModel);
    result.fold(
      (failure) {
        emit(AddNoteFailure(errMessage: failure.errMessage));
      },
      (msg) {
        emit(AddNoteSuccess());
      },
    );
  }
}
