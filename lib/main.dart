import 'package:Expenser_App/widgets/chart.dart';
import 'package:Expenser_App/widgets/new_transaction.dart';
import 'package:Expenser_App/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
          buttonTheme: ButtonThemeData(buttonColor: Colors.purple ,textTheme: ButtonTextTheme.normal),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '1',
    //   title: 'rent',
    //   amount: 22.4,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   title: 'rent2',
    //   amount: 22.41,
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTrasactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)), );
    }).toList() ;
  }

  void _addNewTransaction(String title, double amount,DateTime selectedDate) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: selectedDate);
    setState(() {
      _userTransactions.add(newtx);
    });
  }

  void _startNewAddTrasaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }
  void _deleteTransaction(String id){
    setState(() {
       _userTransactions.removeWhere((element) => element.id == id);
      
    });
   
  }
 

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startNewAddTrasaction(context))
        ],
      );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.3,
              child: Chart(_recentTrasactions)),
            Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.7,
              child: TransactionList(_userTransactions,_deleteTransaction))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        

        child: Icon(Icons.add),
        onPressed: () => _startNewAddTrasaction(context),
      ),
    );
  }
}
