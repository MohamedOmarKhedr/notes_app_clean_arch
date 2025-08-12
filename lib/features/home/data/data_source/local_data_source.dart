import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';

abstract class LocalDataSource {
  Future<List<NoteModel>> getAllNotes(int pageNumber);
  Future<Unit> addNote(NoteModel note);
  Future<Unit> updateNote(NoteModel note);
}

class LocalDataSourceImpl extends LocalDataSource {
  final Box<NoteModel> notesBox;

  LocalDataSourceImpl({required this.notesBox});
  @override
  Future<Unit> addNote(NoteModel note) async {
    await notesBox.add(note);
    return unit;
  }

  @override
  Future<List<NoteModel>> getAllNotes(int pageNumber) async {

  final allNotes = notesBox.values.toList().reversed.toList();

  const int pageSize = 10; 
  final int totalNotes = allNotes.length;
  final int startIndex = pageNumber * pageSize;

  if (startIndex >= totalNotes) {
    return []; 
  }


  final int endIndex = min(startIndex + pageSize , totalNotes);


  
  if (startIndex > endIndex) {
    return []; 
  }
  
  List<NoteModel> notes = allNotes.sublist(startIndex, endIndex);
  
  return notes;
}

  @override
  Future<Unit> updateNote(NoteModel note) async {
    await note.save();
    return unit;
  }
}
