import 'package:expense_tracker/screens/stats/widgets/biggest_transactions.dart';
import 'package:expense_tracker/screens/stats/widgets/current_month.dart';
import 'package:expense_tracker/screens/stats/widgets/previous_month.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CurrentMonth(),
          PreviousMonth(),
          BiggestTransactions(),
        ],
      ),
    );
  }
}
