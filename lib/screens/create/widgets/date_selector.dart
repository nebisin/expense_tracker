import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    Key key,
    @required DateTime selectedDate,
  }) : _selectedDate = selectedDate, super(key: key);

  final DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        child: Text(
          DateFormat.MMMMEEEEd().format(_selectedDate),
          style: Theme.of(context).textTheme.headline4,
        ),
        onPressed: () {},
      ),
    );
  }
}