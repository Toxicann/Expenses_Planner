import 'package:flutter/material.dart';
import '../models/transactions.dart';

import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmt = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmt = recentTransactions[i].amount;
        }
      }

      return {
        'Day': DateFormat.E().format(weekDay),
        'Amount': totalAmt,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactions.map((e) {
          return Column(
            children: <Widget>[
              Text('${e['Day']}'),
              Text('${e['Amount']}'),
            ],
          );
        }).toList(),
      ),
    );
  }
}
