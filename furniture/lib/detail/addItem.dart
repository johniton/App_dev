import 'package:flutter/material.dart';

Widget itemTile(String title, String image, String price) {
  return Card(
    margin: EdgeInsets.all(15),
    child: ListTile(
      leading: Image.asset(image, width: 80, fit: BoxFit.cover),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(price),
      trailing: Icon(Icons.shopping_cart),
    ),
  );
}
