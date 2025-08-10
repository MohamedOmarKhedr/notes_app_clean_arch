import 'package:dartz/dartz.dart';
import 'package:notes_app_clean_arch/core/errors/failures.dart';

abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>> call([Param param]);
}

class NoParam{}
