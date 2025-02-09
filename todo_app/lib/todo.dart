import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String text;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const TodoCard(
      {super.key,
      required this.text,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ]),
          Column(
            children: [
              IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  )),
              IconButton(onPressed: onEdit, icon: Icon(Icons.edit_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
