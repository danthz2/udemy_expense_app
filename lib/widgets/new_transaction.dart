import 'package:flutter/material.dart';
import 'package:udemy_expense_app/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);
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
                addTx(
                    titleController.text, double.parse(amountController.text));
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
