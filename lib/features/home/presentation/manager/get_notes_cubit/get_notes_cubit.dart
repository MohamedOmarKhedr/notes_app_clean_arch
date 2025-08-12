import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/get_notes_use_case.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit(this.getNotesUseCase) : super(GetNotesInitial());
  final GetNotesUseCase getNotesUseCase;

  int currentPageIndex = 0;
  List<NoteModel> notes = [];

  Future<void> getAllNotes({int pageNumber = 0}) async {
    emit(GetNotesLoading());
    if (pageNumber == 0) {
      notes.clear();
      currentPageIndex = 1;
    }

    var result = await getNotesUseCase.call(pageNumber);
    result.fold(
      (failure) {
        emit(GetNotesFailure(errMessage: failure.errMessage));
      },
      (notes) {
        this.notes.addAll(notes);
        emit(GetNotesSuccess(notes: this.notes));
      },
    );
  }

  // 🆕 دالة لإزالة ملاحظة محليًا من القائمة
  void removeNoteLocally(NoteModel note) {
    notes.remove(note);
    emit(GetNotesSuccess(notes: notes));
  }
 
 //for local update notes
  void refreshList() {
    emit(
      GetNotesSuccess(notes: notes),
    ); // إعادة إصدار نفس البيانات لتحديث الواجهة
  }
  //for add update notes
  void addNoteLocally(NoteModel newNote) {
  notes.insert(0,newNote); 
  emit(GetNotesSuccess(notes: notes));
}
}
