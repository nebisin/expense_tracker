import 'transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:provider/provider.dart';

class FavoriteTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Transactions>(context).getFavorites;

    return items.length != 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Favorite Transactions',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TransactionList(items),
            ],
          )
        : Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.indigo[400],
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 5,
                  color: Colors.grey[300],
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Useful Tip',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'You can add a transaction to your favorite list by clicking the hearth icon.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
