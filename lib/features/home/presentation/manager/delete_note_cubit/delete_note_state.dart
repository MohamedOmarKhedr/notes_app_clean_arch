part of 'delete_note_cubit.dart';

abstract class DeleteNoteState {}

final class DeleteNoteInitial extends DeleteNoteState {}

final class DeleteNoteLoading extends DeleteNoteState {}

final class DeleteNoteSuccess extends DeleteNoteState {}

final class DeleteNoteFailure extends DeleteNoteState {
  final String errMessage;

  DeleteNoteFailure({required this.errMessage});
}

final class AfterDeleteNoteSuccess extends DeleteNoteState {}
