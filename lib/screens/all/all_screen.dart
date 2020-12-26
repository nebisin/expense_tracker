import 'package:expense_tracker/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/transaction_item.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allItems = Provider.of<Transactions>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Text('All Transactions'),
      ),
      body: ListView.builder(
        itemCount: allItems.length,
        itemBuilder: (ctx, index) => TransactionItem(allItems[index]),
      ),
    );
  }
}
