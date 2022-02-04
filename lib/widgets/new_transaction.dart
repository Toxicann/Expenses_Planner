import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    String enteredTitle = _titleController.text;
    double enteredAmt = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmt <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmt, _selectedDate);
    Navigator.of(context).pop;
  }

  void _dateSelector() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? "No Date Chosen!"
                        : DateFormat.yMd().format(_selectedDate!),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TextButton(
                    onPressed: _dateSelector,
                    child: const Text(
                      "Choose Date!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: _submitData,
                child: const Text(
                  'Add Transaction',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
