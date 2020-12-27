import 'package:expense_tracker/screens/dashboard/widgets/biggest_transactions.dart';
import 'package:flutter/material.dart';

import 'widgets/latest_transactions.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatestTransactions(),
          BiggestTransactions(),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/all-screen');
              },
              label: Text('Show All Transactions'),
              icon: Icon(Icons.read_more),
            ),
          ),
        ],
      ),
    );
  }
}
