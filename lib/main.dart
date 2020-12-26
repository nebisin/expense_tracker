import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'providers/transactions.dart';
import 'screens/create/create_screen.dart';
import 'screens/home/home_screen.dart';

import 'helpers/custom_route.dart';
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
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromRGBO(61, 90, 128, 1),
          accentColor: Color.fromRGBO(0, 119, 182, 1),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
          inputDecorationTheme: InputDecorationTheme(
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: const BorderSide(
                color: Color.fromRGBO(207, 213, 225, 1),
                width: 0.0,
              ),
            ),
            fillColor: Color.fromRGBO(207, 213, 225, 1),
            filled: true,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(0, 119, 182, 1),
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline5: TextStyle(
              color: Color.fromRGBO(65, 71, 82, 1),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            headline4: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(25, 25, 25, 1),
            ),
            subtitle2: TextStyle(
              fontSize: 14.0,
              color: Color.fromRGBO(25, 25, 25, 0.6),
            ),
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          }),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          '/create-screen': (ctx) => CreateScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
