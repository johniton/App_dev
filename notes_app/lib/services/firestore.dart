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

  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: false).snapshots();

    return notesStream;
  }

  // UPDATE   : update notes given a doc id

  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE    : delete note given a doc id
}
