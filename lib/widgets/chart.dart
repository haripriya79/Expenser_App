import 'package:Expenser_App/models/transaction.dart';
import 'package:Expenser_App/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  // const Chart({Key key}) : super(key: key);

  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactonValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday).toString());
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactonValues.fold(0.0, (sum, ele) {
      return sum + ele['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactonValues);
    print(recentTransactions.length);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),

        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactonValues.map((data) {
          return Flexible(
            
            fit: FlexFit.tight,
                    child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending),
          );
        }).toList()),
      ),
    );
  }
}
