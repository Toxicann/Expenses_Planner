import 'package:expense_planner/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTx;
  const TransactionList(this.transactions, this.deleteTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    "No Transactions Yet!",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.8,
                    child: Image.asset(
                      'assets/images/zzz.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: MediaQuery.of(context).size.width > 425
                      ? TextButton.icon(
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                          label: const Text('Delete'),
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).errorColor,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
          );
  }
}
