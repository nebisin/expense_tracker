import 'package:expense_tracker/screens/dashboard/widgets/ChartBar.dart';
import 'package:flutter/material.dart';

class ChartBox extends StatelessWidget {
  final double? income;
  final double? expense;
  final double? total;
  final String? day;

  ChartBox(this.expense, this.income, this.total, this.day);

  double get result {
    return income! - expense!;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              '\$${result.abs().floor()}',
              style: TextStyle(
                color: result == 0
                    ? Colors.grey
                    : result.isNegative
                        ? Colors.red
                        : Colors.green,
                fontSize: 14,
              ),
            ),
          ),
          ChartBar(expense, income, total),
          Text(
            day!,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
