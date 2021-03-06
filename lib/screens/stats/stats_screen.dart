import 'package:expense_tracker/screens/stats/widgets/biggest_transactions.dart';
import 'package:expense_tracker/screens/stats/widgets/current_month.dart';
import 'package:expense_tracker/screens/stats/widgets/previous_month.dart';
// import 'package:expense_tracker/services/admob_services.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  /*
  @override
  void initState() {
    AdmobService().showIntersitial();

    super.initState();
  }
  */
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
