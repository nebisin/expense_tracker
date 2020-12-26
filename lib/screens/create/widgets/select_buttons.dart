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
        RaisedButton(
          onPressed: () => setType(ActionType.income),
          child: Text('Income'),
          color:
              type == ActionType.income ? Colors.grey[350] : Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20),
            ),
          ),
        ),
        RaisedButton(
          onPressed: () => setType(ActionType.expense),
          child: Text('Expense'),
          color:
              type == ActionType.expense ? Colors.grey[350] : Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
