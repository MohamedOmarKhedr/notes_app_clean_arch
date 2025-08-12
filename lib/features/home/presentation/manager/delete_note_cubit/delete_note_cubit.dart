import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  final Box<NoteModel> notesBox;
  DeleteNoteCubit(this.notesBox) : super(DeleteNoteInitial());

  Future<void> deleteNote({required NoteModel note}) async {
    emit(DeleteNoteLoading());
    try {
      await note.delete();
      emit(DeleteNoteSuccess());
    } catch (e) {
      emit(DeleteNoteFailure(errMessage: 'Failed to delete note: ${e.toString()}'));
    }
  }
}
