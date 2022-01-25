import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final newTransaction;
  NewTransaction(this.newTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
              controller: amountController,
            ),
            TextButton(
              onPressed: () => newTransaction(
                titleController.text,
                double.parse(amountController.text),
              ),
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
