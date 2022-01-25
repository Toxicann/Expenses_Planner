import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          title: const Text('Flutter App'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Card(
                child: Text("Chart!"),
                elevation: 5,
              ),
              Column(
                children: transactions.map(
                  (e) {
                    return Card(
                      elevation: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
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
                                DateFormat.yMMMMd().format(e.date),
                                // e.date.toString(),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
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
