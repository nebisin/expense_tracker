import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class AllTimeStats extends StatelessWidget {
  final List<Transaction> items;

  AllTimeStats(this.items);

  Map<String, dynamic> get getTotals {
    double totalExpense = 0.0;
    double totalIncome = 0.0;

    for (var tx in items) {
      if (tx.type == ActionType.income) {
        totalIncome = totalIncome + tx.amount;
      } else {
        totalExpense = totalExpense + tx.amount;
      }
    }

    return {
      'income': totalIncome.ceil(),
      'expense': totalExpense.ceil(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: Colors.grey[300],
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Total Transaction',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 4,
                      color: Colors.grey[200],
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                      ),
                    ),
                    Text(
                      "\$${getTotals['income']}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 4,
                      color: Colors.grey[200],
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Expense',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                      ),
                    ),
                    Text(
                      "\$${getTotals['expense']}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
