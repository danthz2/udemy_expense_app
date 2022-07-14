import 'package:flutter/material.dart';
import 'package:udemy_expense_app/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // onChanged: ((val) => titleInput = val),
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              // onChanged: ((val) => amountInput = val),
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
            ),
            TextButton(
              onPressed: () {
                var data = Transaction(
                    id: "t3",
                    title: titleController.text,
                    amount: double.parse(amountController.text),
                    date: DateTime.now());

                print("jalan");
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
