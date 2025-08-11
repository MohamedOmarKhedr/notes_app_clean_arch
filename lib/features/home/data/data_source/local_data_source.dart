import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';

abstract class LocalDataSource {
  Future<List<NoteModel>> getAllNotes();
  Future<Unit> addNote(NoteModel note);
  Future<Unit> updateNote(NoteModel note);
  Future<Unit> deleteNote(String noteId);
}

class LocalDataSourceImpl extends LocalDataSource{
  final Box<NoteModel> notesBox;

  LocalDataSourceImpl({required this.notesBox});
  @override
  Future<Unit> addNote(NoteModel note) async {
    await notesBox.add(note);
   return unit;
     
  }

  @override
  Future<Unit> deleteNote(String noteId) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    var notes = notesBox.values.toList();
    return notes;
  }

  @override
  Future<Unit> updateNote(NoteModel note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

}