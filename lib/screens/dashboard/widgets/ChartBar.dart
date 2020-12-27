import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double income;
  final double expense;
  final double total;

  ChartBar(this.expense, this.income, this.total);

  double incomeRate() {
    final rate = ((120 * income) / total);

    return rate;
  }

  double expenseRate() {
    final rate = ((120 * expense) / total);

    return rate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 20,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.grey[350]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              width: 20,
              height: incomeRate(),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              )),
          Container(
              width: 20,
              height: expenseRate(),
              decoration: BoxDecoration(
                color: Colors.red[400],
              )),
        ],
      ),
    );
  }
}
