import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch/core/errors/failures.dart';
import 'package:notes_app_clean_arch/core/use_cases/use_case.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/repos/home_repo.dart';



class UpdateNoteUseCase extends UseCase<Unit,NoteModel>{
  final HomeRepo homeRepo;

  UpdateNoteUseCase({required this.homeRepo});
  
  @override
  Future<Either<Failure, Unit>> call([NoteModel? param]) {
    return homeRepo.updateNote(param!);
  }
 
  }