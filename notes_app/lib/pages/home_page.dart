import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  // Text controller
  TextEditingController textController = TextEditingController();

  // open a dialog box to create a note
  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: TextField(controller: textController),
            backgroundColor: const Color.fromARGB(255, 185, 219, 246),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // add note
                  if (docID == null) {
                    firestoreService.addNote(textController.text);
                  }
                  //update note
                  else {
                    firestoreService.updateNote(docID, textController.text);
                  }
                  //clear the text controller
                  textController.clear();
                  //close the box
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          // If we have data get all the docs
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            // display as a list
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (BuildContext context, int index) {
                // get individual document
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                // Get note from each doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                // Display as list tile
                return ListTile(
                  title: Text(noteText),
                  trailing: IconButton(
                    onPressed: () => openNoteBox(docID: docID),
                    icon: Icon(Icons.edit),
                  ),
                );
              },
            );
          }
          // if no data return no nodes
          else {
            return const Text('NO Notes');
          }
        },
      ),
    );
  }
}
