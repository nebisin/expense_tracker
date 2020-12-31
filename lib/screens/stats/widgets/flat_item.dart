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
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
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
        children: [
          Row(
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
            ],
          ),
          Row(
            children: [
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
