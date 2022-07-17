import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_expense_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "No transactions added yet!",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/waiting.png",
                width: 100,
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text("\$ ${transactions[index].amount}")),
                    ),
                  ),
                  title: Text(
                    "${transactions[index].title}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      transactions[index].date ?? DateTime.now(),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteTx(transactions[index].id),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
