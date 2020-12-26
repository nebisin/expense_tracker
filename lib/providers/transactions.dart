import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Transactions with ChangeNotifier {
  List<Transaction> _items = [];

  List<Transaction> get items {
    return [..._items];
  }

  Future<void> fetchItems() async {
    await Hive.openBox<Transaction>(
      'txs',
      compactionStrategy: (int total, int deleted) {
        return deleted > 20;
      },
    );

    final itemList =
        Hive.box<Transaction>('txs').values.toList().cast<Transaction>();

    _items = itemList;

    notifyListeners();
  }

  Future<void> add(Transaction item) async {
    final transactionBox = Hive.box<Transaction>('txs');

    await transactionBox.put(item.id, item);

    _items.add(item);
    notifyListeners();
  }

  Future<void> remove(String id) async {
    final transactionBox = Hive.box<Transaction>('txs');

    await transactionBox.delete(id);

    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
