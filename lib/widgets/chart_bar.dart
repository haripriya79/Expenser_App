import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constaints){
          return Column(
      children: <Widget>[
        Container(
          height : constaints.maxHeight * 0.15,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
        SizedBox(
          height: constaints.maxHeight * 0.05,
        ),
        Container(
          height:constaints.maxHeight * 0.6,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(heightFactor: spendingPctTotal,
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Theme.of(context).primaryColor),),)
            ],
          ),
        ),
        SizedBox(
          height: constaints.maxHeight * 0.05,
        ),
        Container(
          height: constaints.maxHeight * 0.15,child: FittedBox(child: Text(label))),
      ],
    );
    } );
  }
}
