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
  final List<Expense> _registeredExpenses = [];

  void _openAddExpenseOverly() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  Future _addExpense(Expense expense) async {
    setState(() {
      _registeredExpenses.add(expense);
    });
    print(expense);
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
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
            child: _registeredExpenses.isEmpty
                ? const Text("Empty lists")
                : ExpenseList(
                    expenses: _registeredExpenses,
                    removeExpense: _removeExpense,
                  ),
          )
        ],
      ),
    );
  }
}
