import 'package:flutter/material.dart';

class AiResponse extends StatelessWidget {
  final Map<String, String> data; // 👈 parsed map coming from previous page

  const AiResponse({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Details')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildInfoCard('Ai Summary', data['Title'] ?? 'Not available'),
        ],
      ),
    );
  }

  Widget buildInfoCard(String title, String value) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
