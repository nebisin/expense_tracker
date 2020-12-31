import 'package:expense_tracker/helpers/color_helper.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:expense_tracker/screens/stats/widgets/flat_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BiggestTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Transactions>(context).biggestItems;
    return items.length != 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Biggest Transactions',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
              ),
              Column(
                children: items.map((e) => FlatItem(e)).toList(),
              ),
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
                UIColorHelper.defaultShadow,
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
                    'You can see your all time biggest transactions in this screen.',
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
