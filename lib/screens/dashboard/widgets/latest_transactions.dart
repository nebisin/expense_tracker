import 'chart.dart';
import 'transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/providers/transactions.dart';
import 'package:provider/provider.dart';

class LatestTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Transactions>(context).latestItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Chart(items),
        if (items.length == 0)
          InkWell(
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
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    color: Colors.grey[400],
                  )
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
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'Latest Transactions',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TransactionList(items),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/all-screen');
                  },
                  label: Text('Show All Transactions'),
                  icon: Icon(Icons.read_more),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
