import 'package:expense_planner/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map(
        (e) {
          return Card(
            elevation: 3,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.blue,
                    ),
                  ),
                  child: Text(
                    '\$ ${e.amount}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(e.date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
