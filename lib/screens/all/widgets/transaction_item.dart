import 'package:expense_tracker/helpers/color_helper.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction item;
  final DateTime dateBefore;

  TransactionItem(this.item, this.dateBefore);

  @override
  Widget build(BuildContext context) {
    var rowChildren = <Widget>[
      Flexible(
        flex: 1,
        child: Column(
          crossAxisAlignment: item.type == ActionType.expense ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title.isNotEmpty
                  ? item.title
                  : item.type == ActionType.expense
                      ? 'Expense'
                      : 'Income',
              style: Theme.of(context).textTheme.headline5,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
            Text(
              DateFormat('MMMM d').format(item.date),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          right: 10,
        ),
        child: Text(
          '\$${item.amount}',
          style: TextStyle(
            color: item.type == ActionType.expense
                ? Theme.of(context).errorColor
                : Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (dateBefore == null || dateBefore.day != item.date.day)
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Text(
                DateFormat('MMMM d').format(item.date),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          Container(
            margin: EdgeInsets.only(
              left: item.type == ActionType.expense ? 50 : 0,
              right: item.type == ActionType.income ? 50 : 0,
              top: 20,
              bottom: 20,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: item.type == ActionType.expense
                    ? Radius.circular(20)
                    : Radius.zero,
                right: item.type == ActionType.income
                    ? Radius.circular(20)
                    : Radius.zero,
              ),
              boxShadow: [
                UIColorHelper.defaultShadow,
              ],
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: item.type == ActionType.income
                  ? rowChildren
                  : rowChildren.reversed.toList(),
            ),
          ),
        ],
      ),
    );
  }
}
