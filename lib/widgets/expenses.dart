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
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense deleted"),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App"),
        centerTitle: false,
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
                ? const Center(
                    child: Text("Empty lists. Start adding some"),
                  )
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
