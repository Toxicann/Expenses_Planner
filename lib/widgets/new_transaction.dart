import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  void _submitData() {
    String enteredTitle = titleController.text;
    double enteredAmt = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmt <= 0) {
      return;
    }

    addTx(enteredTitle, enteredAmt);
  }

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
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
              controller: amountController,
              // keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            TextButton(
              onPressed: _submitData,
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
