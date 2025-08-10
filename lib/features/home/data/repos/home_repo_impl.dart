import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:notes_app_clean_arch/core/errors/failures.dart';
import 'package:notes_app_clean_arch/features/home/data/data_source/local_data_source.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final LocalDataSource localDataSource;

  HomeRepoImpl({required this.localDataSource});
  @override
  Future<Either<Failure, List<NoteModel>>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> addNote(NoteModel note) async {
    try {
      String msg = await localDataSource.addNote(note);
      return right(msg);
    }catch (e) {
      if(e is HiveError) {
        return left(LocalDataFailure.fromHiveError(e));
      }
      return left(LocalDataFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteNote(String noteId) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateNote(NoteModel note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
