import 'package:flutter/material.dart';

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
              Card(
                child: Text("Transactions here"),
                elevation: 5,
              ),
            ],
          ),
        ));
  }
}
