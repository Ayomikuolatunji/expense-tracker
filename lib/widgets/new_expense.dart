import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpense();
}

class _NewExpense extends State<NewExpense> {
  String enteredTitle = "";

  void _saveTitleInput(String inputValue) {
    setState(() {
      enteredTitle = inputValue;
    });
    print(inputValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Enter")),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Button"))
            ],
          )
        ],
      ),
    );
  }
}
