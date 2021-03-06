import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  final ActionType type;
  final double amount;
  final String title;
  final DateTime date;

  Preview(this.type, this.amount, this.title, this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 20,
              left: 10,
              bottom: 20,
            ),
            child: Text(
              '\$$amount',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Income',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Ocak, 12',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
