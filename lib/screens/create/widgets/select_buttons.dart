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
          child: const Text(
            'Income',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary:
                type == ActionType.income ? Colors.grey[350] : Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => setType(ActionType.expense),
          child: const Text(
            'Expense',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary:
                type == ActionType.expense ? Colors.grey[350] : Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
