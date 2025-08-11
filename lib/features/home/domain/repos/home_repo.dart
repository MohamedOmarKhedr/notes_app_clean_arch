import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch/core/errors/failures.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, Unit>> addNote(NoteModel note);
  Future<Either<Failure, Unit>> updateNote(NoteModel note);
  Future<Either<Failure, List<NoteModel>>> getAllNotes();

}

