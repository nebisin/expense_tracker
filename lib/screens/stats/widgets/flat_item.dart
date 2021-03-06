import 'package:expense_tracker/helpers/color_helper.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FlatItem extends StatelessWidget {
  final Transaction item;

  FlatItem(this.item);

  @override
  Widget build(BuildContext context) {
    Future<void> _showDeleteDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are you sure?',
              style: Theme.of(context).textTheme.headline5,
            ),
            content: Text('Are you sure to delete this transaction?'),
            actions: [
              TextButton(
                onPressed: () {
                  Provider.of<Transactions>(context, listen: false)
                      .removeItem(item.id);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    }

    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          UIColorHelper.defaultShadow,
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 20,
              left: 10,
              bottom: 20,
            ),
            child: Text(
              '\$${item.amount.toInt()}',
              style: TextStyle(
                color: item.type == ActionType.expense
                    ? Theme.of(context).errorColor
                    : Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title!.isNotEmpty
                      ? item.title!
                      : item.type == ActionType.expense
                          ? 'Expense'
                          : 'Income',
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  maxLines: 2,
                ),
                Container(
                  child: Text(
                    DateFormat('MMMM d').format(item.date),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 10,
              left: 20,
              bottom: 20,
            ),
            child: IconButton(
              color: Theme.of(context).errorColor,
              icon: Icon(Icons.delete),
              onPressed: _showDeleteDialog,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 10,
              bottom: 20,
            ),
            child: IconButton(
              color: Theme.of(context).accentColor,
              icon: item.isFavorite == false
                  ? Icon(Icons.favorite_border)
                  : Icon(Icons.favorite),
              onPressed: () {
                final newItem = Transaction(
                  id: item.id,
                  type: item.type,
                  title: item.title,
                  amount: item.amount,
                  date: item.date,
                  category: item.category,
                  isFavorite: !item.isFavorite!,
                );
                Provider.of<Transactions>(context, listen: false)
                    .updateItem(item.id, newItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}
