import 'dart:ui';

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Text("Chart!"),
                elevation: 5,
              ),
              Column(
                children: transactions.map(
                  (e) {
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e.date.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.blue,
                              ),
                            ),
                            child: Text(
                              e.amount.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ));
  }
}
