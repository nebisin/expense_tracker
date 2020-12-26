import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Transactions with ChangeNotifier {
  List<Transaction> _items = [];

  List<Transaction> get items {
    return [..._items];
  }

  List<Transaction> get latestItems {
    return _items.take(3).toList();
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

    _items = itemList.reversed.toList();

    notifyListeners();
  }

  Future<void> addItem(Transaction item) async {
    final transactionBox = Hive.box<Transaction>('txs');

    await transactionBox.put(item.id, item);

    _items.insert(0, item);
    notifyListeners();
  }

  Future<void> removeItem(String id) async {
    final transactionBox = Hive.box<Transaction>('txs');

    await transactionBox.delete(id);

    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> updateItem(String id, Transaction item) async {
    final transactionBox = Hive.box<Transaction>('txs');

    await transactionBox.put(id, item);

    final itemIndex = _items.indexWhere((element) => element.id == id);

    _items[itemIndex] = item;
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
