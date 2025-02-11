import 'dart:ffi';

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
  double total = 0.0;

  void addExpense() {
    if (itemController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      total += int.parse(amountController.text);
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
      backgroundColor: const Color.fromARGB(255, 172, 120, 222),
      appBar: AppBar(title: Text('Expense Tracker'), centerTitle: true),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/page2back.png'),
                fit: BoxFit.cover)),
        child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  controller: itemController,
                  decoration: InputDecoration(
                      label: Text(
                    'Item Name',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                      label: Text('Total Expenditure',
                          style: TextStyle(color: Colors.white))),
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                      label: Text('Date of purchase',
                          style: TextStyle(color: Colors.white))),
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
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 2.5, color: Colors.black)),
                            child: ListTile(
                              title: Text(
                                Expense['item']!,
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                  "Rs ${Expense['amount']} on ${Expense['date']} ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      total -=
                                          int.parse(expenses[index]['amount']!);

                                      expenses.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                            ),
                          );
                        })),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(color: Colors.deepOrange),
                  child: Row(
                    children: [
                      Text(
                        'Total Expenditure ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text('Rs $total',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

//// Make another card class and send the input as paramerters
