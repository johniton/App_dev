import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Get Collection of notes

  final CollectionReference notes = FirebaseFirestore.instance.collection(
    'notes',
  );

  // CREATE  : add a  note

  Future<void> addNote(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  // READ    : reda notes from database

  // UPDATE   : update notes given a doc id

  //DELETE    : delete note given a doc id
}
