// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final double spendingAmount;
  final double spendingPercTotal;

  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPercTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: constraints.maxHeight * 0.6,
                  width: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
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
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  spendingAmount.toStringAsFixed(0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
