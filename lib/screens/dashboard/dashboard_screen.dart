import 'package:expense_tracker/screens/dashboard/widgets/favorite_transactions.dart';
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
          FavoriteTransactions(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
