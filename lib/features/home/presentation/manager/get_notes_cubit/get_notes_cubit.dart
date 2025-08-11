import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/get_notes_use_case.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit(this.getNotesUseCase) : super(GetNotesInitial());
  final GetNotesUseCase getNotesUseCase;

  Future<void> getAllNotes() async {
    emit(GetNotesLoading());
    var result = await getNotesUseCase.call();
    result.fold((failure){
      emit(GetNotesFailure(errMessage: failure.errMessage));
    }, (notes){
      emit(GetNotesSuccess(notes: notes));
    });

}
}
