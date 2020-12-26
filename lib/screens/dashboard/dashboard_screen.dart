import 'package:flutter/material.dart';

import 'widgets/latest_transactions.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            LatestTransactions(),
          ],
        ),
      );
  }
}