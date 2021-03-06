import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class SelectButtons extends StatelessWidget {
  final ActionType type;
  final Function setType;

  SelectButtons(this.type, this.setType);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => setType(ActionType.income),
          child: Text('Income'),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => type == ActionType.income
                  ? Colors.grey[350]
                  : Colors.grey[300],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => setType(ActionType.expense),
          child: Text('Expense'),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => type == ActionType.expense
                  ? Colors.grey[350]
                  : Colors.grey[300],
            ),
          ),
        ),
      ],
    );
  }
}
