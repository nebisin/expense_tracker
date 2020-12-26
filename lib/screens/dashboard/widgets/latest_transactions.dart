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
        Container(
          padding: EdgeInsets.only(left: 20, top: 30),
          child: Text(
            'Lastest Transactions',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        TransactionList(items),
      ],
    );
  }
}
