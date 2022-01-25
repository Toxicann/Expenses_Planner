import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transactions.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> _userTransactions = [
    Transactions(
      id: '1',
      title: 'Bag',
      amount: 69.69,
      date: DateTime.now(),
    ),
    Transactions(
      id: '2',
      title: 'Jeans',
      amount: 420.50,
      date: DateTime.now(),
    )
  ];

  void _addNewTransactions(String txTitle, double txAmount) {
    final tx = Transactions(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransactions),
        TransactionList(_userTransactions),
      ],
    );
  }
}
