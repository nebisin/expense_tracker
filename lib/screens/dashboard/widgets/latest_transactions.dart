import 'chart.dart';
import 'transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:provider/provider.dart';

class LatestTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Transactions>(context).latestItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Chart(items),
        Opacity(
          opacity: 0.5,
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              'Latest Transactions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        TransactionList(items),
      ],
    );
  }
}
