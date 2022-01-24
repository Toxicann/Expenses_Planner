import 'package:flutter/material.dart';
import './transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transactions> transactions = [
    Transactions(id: 1, title: 'Bag', amount: 69.69, date: DateTime.now()),
    Transactions(id: 2, title: 'Jeans', amount: 420.50, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Card(
                child: Text("Chart!"),
                elevation: 5,
              ),
              Column(
                children: transactions.map((e) {
                  return Card(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(e.title),
                            Text(e.date.toString()),
                          ],
                        ),
                        Text(e.amount.toString())
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ));
  }
}
