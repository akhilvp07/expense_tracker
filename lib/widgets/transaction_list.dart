import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
      //Card for transactions
      return Card(
        child: Row(
          children: <Widget>[
            //Container to display amount
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                '₹ ${tx.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrange,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepOrange,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
            //Column for the title and date of transaction
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tx.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('dd-MMM-yyyy hh:mm a').format(tx.date),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList());
  }
}
