/*
import 'package:Expenser_App/widgets/new_transaction.dart';
import 'package:Expenser_App/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';


class UserTransaction extends StatefulWidget {
 UserTransaction({Key key}) : super(key: key);

  @override
   UserTransactionState createState() =>  UserTransactionState();
}

class  UserTransactionState extends State<UserTransaction> {
    final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'rent',
      amount: 22.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'rent2',
      amount: 22.41,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String title , double amount){
    final newtx = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newtx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addNewTransaction),TransactionList(_userTransactions,_)],
    );
  }
}*/