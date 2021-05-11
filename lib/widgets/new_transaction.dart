import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) {
                //   titleInput = value;
                // },
                controller: _titleController,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) {
                //   amountInput = value;
                // },
                controller: _amountController,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: OutlinedButton.icon(
                  autofocus: true,
                  onPressed: _presentDatePicker,
                  icon: Icon(Icons.today_rounded),
                  label: Text(DateFormat.yMMMd().format(_selectedDate)),
                  style: OutlinedButton.styleFrom(
                    shadowColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.only(
                      left: 0,
                      right: 4,
                      top: 4,
                      bottom: 4,
                    ),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.button.color),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  child: Text('Add Transaction'),
                  onPressed: _submitData,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
