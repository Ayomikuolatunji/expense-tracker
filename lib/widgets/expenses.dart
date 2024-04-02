import 'package:flutter/material.dart';
import 'package:net_ninja_course/widgets/expenses_lists.dart';
import "package:net_ninja_course/models/expense.dart";
import 'package:net_ninja_course/widgets/new_expense.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter course",
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Flutter",
        amount: 100,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverly() {
    showBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverly, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(
            child: ExpenseList(
              expenses: _registeredExpenses,
            ),
          )
        ],
      ),
    );
  }
}
