import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return //User inputs
        Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) {
              //   titleInput = value;
              // },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: amountController,
            ),
            TextButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(primary: Colors.deepOrange),
              onPressed: () {
                addNewTransaction(
                    titleController.text, double.parse(amountController.text));
                print(titleController.text);
                print(amountController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
