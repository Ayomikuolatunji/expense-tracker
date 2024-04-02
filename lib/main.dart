import 'package:flutter/material.dart';
import 'package:net_ninja_course/widgets/expenses.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: const Scaffold(
      body: Expenses(),
    ),
  ));
}
