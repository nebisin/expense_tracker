import 'package:expense_tracker/services/admob_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/transaction.dart';
import '../../providers/transactions.dart';

import 'widgets/create_form.dart';
import 'widgets/date_selector.dart';
import 'widgets/select_buttons.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();

  var _selectedDate = DateTime.now();
  var _type = ActionType.expense;
  // String _tag;

  void _setType(ActionType newType) {
    setState(() {
      _type = newType;
    });
  }

  void _setDate(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  void _saveTransaction() async {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      amount: double.parse(_amountController.text),
      title: _titleController.text,
      date: _selectedDate,
      type: _type,
    );

    await Provider.of<Transactions>(context, listen: false)
        .addItem(newTransaction);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    AdmobService().showBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    AdmobService().hideBannerAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_type == ActionType.expense ? 'New Expense' : 'New Income'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SelectButtons(_type, _setType),
              DateSelector(_selectedDate, _setDate),
              SizedBox(height: 10),
              CreateForm(
                formKey: _formKey,
                amountController: _amountController,
                titleController: _titleController,
              ),
              /*
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: DropdownButton(
                  isExpanded: true,
                  value: _tag,
                  onChanged: (newValue) {
                    setState(() {
                      _tag = newValue;
                    });
                  },
                  hint: Text('Choose a category (optinal)'),
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              */
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                child: RaisedButton.icon(
                  onPressed: _saveTransaction,
                  icon: Icon(Icons.save),
                  label: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
            SizedBox(height: 20),
            Preview(
              _type,
              double.tryParse(_amountController.text),
              _titleController.text,
              _selectedDate,
            ),
*/
