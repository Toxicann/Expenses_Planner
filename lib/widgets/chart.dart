import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmt = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmt += recentTransactions[i].amount;
        }
      }

      return {
        'Day': DateFormat.E().format(weekDay),
        'Amount': totalAmt,
      };
    });
  }

  double get totalSpendingAmount {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['Amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactions.map((e) {
          return ChartBar(
            label: e['Day'],
            spendingAmount: e['Amount'],
            spendingPercTotal: totalSpendingAmount == 0.0
                ? 0.0
                : (e['Amount'] as double) /
                    totalSpendingAmount, //its in fraction: if 100% then 1
          );
        }).toList(),
      ),
    );
  }
}
