import 'package:expense_tracker/models/transaction.dart';
import 'transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> items;

  TransactionList(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemBuilder: (ctx, index) => TransactionItem(items[index]),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
