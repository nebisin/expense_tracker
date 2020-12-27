import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  DateSelector(this.selectedDate, this.setDate);

  final DateTime selectedDate;
  final Function setDate;

  @override
  Widget build(BuildContext context) {
    void showDate() {
      showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
      ).then((value) {
        if(value == null) return;
        setDate(value);
      });
    }

    return Container(
      alignment: Alignment.center,
      child: TextButton(
        child: Text(
          DateFormat.MMMMEEEEd().format(selectedDate),
          style: Theme.of(context).textTheme.headline4,
        ),
        onPressed: showDate,
      ),
    );
  }
}
