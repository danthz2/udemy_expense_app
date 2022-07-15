import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_expense_app/models/transaction.dart';
import 'package:udemy_expense_app/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    //get group membuat chart dengan mengenerate 7 data
    return List.generate(
      7,
      (index) {
        //mebuat variabel weekDay untuk mengekstrak huruf 'Day' dari DateTime Now
        // Standar DateTime.now() => 2022-07-14 16:43:51.354
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;
        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date?.day == weekDay.day &&
              recentTransactions[i].date?.month == weekDay.month &&
              recentTransactions[i].date?.year == weekDay.year) {
            totalSum += recentTransactions[i].amount ?? 0;
          }
        }

        return {
          //  value dari key 'day' diambil dari weekDay yang sudah di substract menjadi 1 huruf Day (contoh Tuesday = T)
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum.toStringAsFixed(2),
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionsValues.fold<double>(
      0,
      (sum, item) {
        return sum + (double.parse(item['amount'].toString()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'].toString(),
                double.parse(data['amount'].toString()),
                totalSpending == 0.0
                    ? 0.0
                    : double.parse(data['amount'].toString()) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
