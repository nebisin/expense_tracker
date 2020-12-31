import 'package:expense_tracker/helpers/color_helper.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stat_card.dart';

class PreviousMonth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allItems = Provider.of<Transactions>(context)
        .monthlyItem(DateTime.now().month - 1);

    return allItems.length != 0
        ? StatCard('Previous Month', allItems)
        : Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.indigo[400],
              boxShadow: [
                UIColorHelper.defaultShadow,
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Useful Tip',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'For more statistics you can add your previous transactions by selecting the date.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
