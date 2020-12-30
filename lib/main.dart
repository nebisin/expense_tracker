import 'package:expense_tracker/helpers/custom_theme.dart';
import 'package:expense_tracker/screens/all/all_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'providers/transactions.dart';
import 'screens/create/create_screen.dart';
import 'screens/home/home_screen.dart';


import 'models/transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(ActionTypeAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.box<Transactions>('txs').compact();
    Hive.box<Transactions>('txs').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Transactions(),
      child: MaterialApp(
        title: 'Expense Tracker',
        theme: customTheme,
        home: HomeScreen(),
        routes: {
          '/create-screen': (ctx) => CreateScreen(),
          '/all-screen': (ctx) => AllScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
