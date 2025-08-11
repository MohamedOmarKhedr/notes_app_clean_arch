import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch/core/errors/failures.dart';
import 'package:notes_app_clean_arch/core/use_cases/use_case.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/repos/home_repo.dart';

class GetNotesUseCase extends UseCase <List<NoteModel>,NoParam>{
  final HomeRepo homeRepo;

  GetNotesUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<NoteModel>>> call([NoParam? param]) async{
    var notes =await homeRepo.getAllNotes();
    return notes;
  }
  
}

