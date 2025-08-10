part of 'add_note_cubit.dart';

abstract  class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {
  final String msg;

  AddNoteSuccess({required this.msg});
}

final class AddNoteFailure extends AddNoteState {
  final String errMessage;

  AddNoteFailure({required this.errMessage});
}



