import 'package:expense_tracker/helpers/color_helper.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stat_card.dart';

class CurrentMonth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allItems =
        Provider.of<Transactions>(context).monthlyItem(DateTime.now().month);

    return allItems.length == 0
        ? InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/create-screen');
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              height: 150,
              margin: EdgeInsets.only(top: 40, left: 20, bottom: 30, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigo[400],
                boxShadow: [
                  UIColorHelper.defaultShadow,
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'You don\'t have any transaction yet. Let\'s add some!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : StatCard('Current Month', allItems);
  }
}
