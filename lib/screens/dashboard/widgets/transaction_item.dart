import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionItem extends StatelessWidget {
  final Transaction item;

  TransactionItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: Colors.grey[300],
          )
        ],
      ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.title.isNotEmpty
                    ? item.title
                    : item.type == ActionType.expense
                        ? 'Expense'
                        : 'Income',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                DateFormat('MMMM d').format(item.date),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
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
              onPressed: () {
                Provider.of<Transactions>(context, listen: false)
                    .removeItem(item.id);
              },
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
                  isFavorite: !item.isFavorite,
                );
                Provider.of<Transactions>(context, listen: false)
                    .updateItem(item.id, newItem);
              },
            ),
          )
        ],
      ),
    );
  }
}
