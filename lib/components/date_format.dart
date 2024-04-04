import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formetter = DateFormat.yMd();

class CustomDateFormat extends StatelessWidget {
  const CustomDateFormat({required this.selectedDate, super.key});

  final DateTime selectedDate;

  String get getFormattedDate {
    return formetter.format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Text(getFormattedDate);
  }
}
