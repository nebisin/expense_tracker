import 'transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:provider/provider.dart';

class BiggestTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Transactions>(context).biggestItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              'Biggest Transactions',
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
