part of 'get_notes_cubit.dart';

abstract class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesLoading extends GetNotesState {}

final class GetNotesSuccess extends GetNotesState {
  final List<NoteModel> notes;

  GetNotesSuccess({required this.notes});

}

final class GetNotesFailure extends GetNotesState {
  final String errMessage;

  GetNotesFailure({required this.errMessage});
}

