import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
   //   height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("no Trasactions Yet!",
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png')),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5,),
                                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                                            child: FittedBox(
                                              child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                               style: Theme.of(context).textTheme.headline6 ,
                               ),
                    subtitle: Text( DateFormat()
                                   .add_yMMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(color: Colors.grey),),
                    trailing: MediaQuery.of(context).size.width>400? 
                    FlatButton.icon(onPressed: (){deleteTx(transactions[index].id);}, icon: Icon(Icons.delete), label: Text("Delete"),textColor: Theme.of(context).errorColor)
                    : IconButton(icon: Icon(Icons.delete),onPressed: (){deleteTx(transactions[index].id);},color: Theme.of(context).errorColor,),
                              
                  ),
                );
                //Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Colors.purple,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16,
                //             color: Colors.purple,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6 ,
                //           ),
                //           Text(
                //             DateFormat()
                //                 .add_yMMMMd()
                //                 .format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            
            ),
    );
  }
}
