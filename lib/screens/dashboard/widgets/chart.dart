import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ChartBox.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalIncome = 0.0;
      var totalExpense = 0.0;

      for (var tx in recentTransactions) {
        if (tx.type == ActionType.income) {
          if (tx.date.day == weekDay.day &&
              tx.date.month == weekDay.month &&
              tx.date.year == weekDay.year) {
            totalIncome += tx.amount;
          }
        } else {
          if (tx.date.day == weekDay.day &&
              tx.date.month == weekDay.month &&
              tx.date.year == weekDay.year) {
            totalExpense += tx.amount;
          }
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'income': totalIncome,
        'expense': totalExpense,
      };
    }).reversed.toList();
  }

  double get totalAmount {
    return recentTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element.amount;
    });
  }

  double get maxTransaction {
    final biggest = groupedTransactionValues.reduce((value, element) {
      if (value['income'] + value['expense'] >
          element['income'] + element['expense']) {
        return value;
      } else {
        return element;
      }
    });

    final biggestTotal = biggest['income'] + biggest['expense'];

    return biggestTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: Colors.grey[300],
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((data) {
          return ChartBox(
            data['expense'],
            data['income'],
            maxTransaction,
            data['day'],
          );
        }).toList(),
      ),
    );
  }
}
