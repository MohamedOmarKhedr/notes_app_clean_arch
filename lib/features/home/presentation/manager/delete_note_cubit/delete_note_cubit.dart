import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_clean_arch/core/widgets/show_error_snack_bar.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  final Box<NoteModel> notesBox;
  DeleteNoteCubit(this.notesBox) : super(DeleteNoteInitial());

  Future<void> deleteNote({required int noteId}) async {
    emit(DeleteNoteLoading());
    await notesBox.delete(noteId);
    emit(DeleteNoteSuccess());
  }

  afterDeleteNoteSuccess(BuildContext context) {
    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
    ShowCustomSnackBar.showError(context: context, message: 'The Note has been deleted successfully');
    emit(AfterDeleteNoteSuccess());
  }

}
