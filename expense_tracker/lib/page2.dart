import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return ExpenseTracker();
  }
}

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final TextEditingController itemController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final List<Map<String, String>> expenses = [];

  void addExpense() {
    if (itemController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      setState(() {
        expenses.add({
          'item': itemController.text,
          'amount': amountController.text,
          'date': dateController.text
        });
      });
      itemController.clear();
      amountController.clear();
      dateController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: itemController,
              decoration: InputDecoration(label: Text('Item Name')),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(label: Text('Total Expenditure')),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(label: Text('Date of purchase')),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
                onPressed: addExpense, label: Text('Submit Expense')),
            SizedBox(height: 30),
            Expanded(
                child: ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      final Expense = expenses[index];
                      return ListTile(
                        title: Text(Expense['item']!),
                        subtitle: Text(
                            "Rs ${Expense['amount']} on ${Expense['date']} "),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                expenses.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete)),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
///////
///

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expense Tracker"),
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: itemController,
//               decoration: const InputDecoration(labelText: "Item Name"),
//             ),
//             TextField(
//               controller: amountController,
//               decoration: const InputDecoration(labelText: "Total Expenditure"),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: dateController,
//               decoration: const InputDecoration(labelText: "Date of Purchase"),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: addExpense,
//               child: const Text("Add Expense"),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: expenses.length,
//                 itemBuilder: (context, index) {
//                   final expense = expenses[index];
//                   return ListTile(
//                     title: Text(expense['item']!),
//                     subtitle:
//                         Text("₹${expense['amount']} on ${expense['date']}"),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete, color: Colors.red),
//                       onPressed: () {
//                         setState(() {
//                           expenses.removeAt(index);
//                         });
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
