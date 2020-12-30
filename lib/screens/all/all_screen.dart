import 'package:expense_tracker/providers/transactions.dart';
import 'package:expense_tracker/screens/all/widgets/all_time_stats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/transaction_item.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allItems = Provider.of<Transactions>(context).sortedByDate;

    return Scaffold(
      appBar: AppBar(
        title: Text('All Transactions'),
      ),
      body: ListView.builder(
        itemCount: allItems.length + 1,
        itemBuilder: (ctx, index) {
          if (index == 0)
            return AllTimeStats(allItems);
          else
            return TransactionItem(
              allItems[index - 1],
              index == 1 ? null : allItems[index - 2].date,
            );
        },
      ),
    );
  }
}
