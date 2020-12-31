import 'package:flutter/material.dart';

class CreateForm extends StatelessWidget {
  const CreateForm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController amountController,
    @required TextEditingController titleController,
  })  : _formKey = formKey,
        _amountController = amountController,
        _titleController = titleController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _amountController;
  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
              prefixText: '\$',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Plase enter an amount for your transaction.';
              }
              if (double.tryParse(value) == null ||
                  double.tryParse(value) <= 0) {
                return 'Please enter a valid amount.';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _titleController,
            maxLength: 20,
            maxLengthEnforced: true,
            decoration: InputDecoration(
              labelText: 'Description (optinal)',
            ),
          ),
        ],
      ),
    );
  }
}
