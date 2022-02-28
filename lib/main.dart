import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import '../models/transactions.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'PoiretOne',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontFamily: 'PoiretOne',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              bodyText2: const TextStyle(
                fontFamily: 'SourceCodePro',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              headline1: const TextStyle(
                fontFamily: 'PoiretOne',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              subtitle1: const TextStyle(
                fontFamily: 'SourceCodePro',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addNewTransactions);
        });
  }

  final List<Transactions> _userTransactions = [];

  List<Transactions> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransactions(String txTitle, double txAmount, DateTime txDate) {
    final tx = Transactions(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }

  void _deleteTransactions(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  bool _showchart = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () => _showAddNewTransaction(context),
          icon: const Icon(Icons.add),
          iconSize: 30,
        )
      ],
      title: const Text('Expenses Tracker'),
    );
    final txList = SizedBox(
      child: TransactionList(_userTransactions, _deleteTransactions),
      height: (mediaQuery.size.height -
              mediaQuery.padding.top -
              appBar.preferredSize.height -
              mediaQuery.padding.bottom) *
          0.7,
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Show Chart"),
                    Switch.adaptive(
                        value: _showchart,
                        onChanged: (val) {
                          setState(() {
                            _showchart = val;
                          });
                        })
                  ],
                ),
              if (!isLandscape)
                SizedBox(
                  child: Chart(_recentTransactions),
                  height: (mediaQuery.size.height -
                          mediaQuery.padding.top -
                          appBar.preferredSize.height -
                          mediaQuery.padding.bottom) *
                      0.3,
                ),
              if (!isLandscape) txList,
              if (isLandscape)
                _showchart
                    ? SizedBox(
                        child: Chart(_recentTransactions),
                        height: (mediaQuery.size.height -
                                mediaQuery.padding.top -
                                appBar.preferredSize.height -
                                mediaQuery.padding.bottom) *
                            0.6,
                      )
                    : txList
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
