import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';

abstract class LocalDataSource {
  Future<List<NoteModel>> getAllNotes();
  Future<String> addNote(NoteModel note);
  Future<String> updateNote(NoteModel note);
  Future<String> deleteNote(String noteId);
}

class LocalDataSourceImpl extends LocalDataSource{
  final Box<NoteModel> notesBox;

  LocalDataSourceImpl({required this.notesBox});
  @override
  Future<String> addNote(NoteModel note) async {
    await notesBox.add(note);
    return 'Add the note successfully';  
  }

  @override
  Future<String> deleteNote(String noteId) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Future<String> updateNote(NoteModel note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

}