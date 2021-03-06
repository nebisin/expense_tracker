import 'package:expense_tracker/helpers/color_helper.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          UIColorHelper.defaultShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((data) {
          return ChartBox(
            data['expense'],
            data['income'],
            totalAmount,
            data['day'],
          );
        }).toList(),
      ),
    );
  }
}
