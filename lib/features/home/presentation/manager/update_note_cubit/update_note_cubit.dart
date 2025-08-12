import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/update_note_use_case.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  final UpdateNoteUseCase updateNoteUseCase;

  UpdateNoteCubit(this.updateNoteUseCase) : super(UpdateNoteInitial());

  Future<void> updateNote({required NoteModel note}) async {
    emit(UpdateNoteLoading());
    var result = await updateNoteUseCase.call(note);
    result.fold(
      (failure) {
        emit(UpdateNoteFailure(errMessage: failure.errMessage));
      },
      (note) {
        emit(UpdateNoteSuccess());
      },
    );
  }

  
}
