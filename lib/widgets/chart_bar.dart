// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final spendingAmount;
  final double spendingPercTotal;

  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPercTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(label),
        const SizedBox(
          height: 5,
        ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 80,
              width: 10,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Colors.blueGrey,
                  ),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              height: spendingPercTotal * 80,
              width: 7,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.purple,
                  ),
                  borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text('$spendingAmount'),
      ],
    );
  }
}
