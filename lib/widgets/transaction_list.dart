import 'package:flutter/material.dart';
import 'package:udemy_expense_app/models/transaction.dart';
import 'package:udemy_expense_app/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionListPage');
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions.map((tx) {
            {
              return TransactionItem(
                key: Key(tx.id!),
                transaction: tx,
                deleteTx: deleteTx,
              );
            }
          }).toList());
  }
}
