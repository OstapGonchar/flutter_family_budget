import 'package:family_budget/models/account.dart';
import 'package:family_budget/models/transaction.dart';
import 'package:family_budget/services/account_service.dart';
import 'package:family_budget/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddTransactionWidget extends StatefulWidget {
  const AddTransactionWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddTransactionState();
  }
}

class _AddTransactionState extends State<AddTransactionWidget> {
  final _transactionDateTextController = TextEditingController();
  final DateFormat _dateFormat = DateFormat("yyyy-MM-dd");
  final _formKey = GlobalKey<FormState>();

  Account _account = const Account('Nordea', id: 1);
  String _budget = 'April 2022';
  DateTime _transactionDate = DateTime.now();
  double _amount = 0;
  String _currency = 'DKK';
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add transaction'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            accountRow(),
            budgetRow(),
            dateRow(),
            amountRow(),
            titleRow(),
            descriptionRow()
          ],
        ),
      ),
      bottomSheet: bottomButtons(context),
    );
  }

  @override
  void dispose() {
    _transactionDateTextController.dispose();
    super.dispose();
  }

  Row accountRow() {
    return Row(
      children: [
        label('Account:'),
        Expanded(
            child: DropdownButtonFormField(
          value: _account,
          isExpanded: true,
          items: AccountService()
              .getAccounts()
              .map<DropdownMenuItem<Account>>((Account value) {
            return DropdownMenuItem<Account>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
          onChanged: (Account? newValue) {
            setState(() {
              _account = newValue!;
            });
          },
          validator: isNullValidator(),
        ))
      ],
    );
  }

  Row budgetRow() {
    return Row(
      children: [
        label('Budget:'),
        Expanded(
            child: DropdownButtonFormField(
          value: _budget,
          isExpanded: true,
          items: <String>['April 2022']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _budget = newValue!;
            });
          },
          validator: isEmptyStringValidator(),
        ))
      ],
    );
  }

  Row dateRow() {
    return Row(
      children: [
        label('Date:'),
        Expanded(
            child: TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter transaction date'),
          controller: _transactionDateTextController,
          validator: isEmptyStringValidator(),
        )),
        IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: _selectDate,
        )
      ],
    );
  }

  Row amountRow() {
    return Row(
      children: [
        label('Amount:'),
        Expanded(
            child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
          ],
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter transaction amount'),
          validator: isEmptyStringValidator(),
          onChanged: (String? newValue) {
            setState(() {
              _amount = double.parse(newValue!);
            });
          },
        )),
        DropdownButton(
            value: _currency,
            items: <String>['DKK', 'USD']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _currency = newValue!;
              });
            })
      ],
    );
  }

  Row titleRow() {
    return Row(
      children: [
        label('Title:'),
        Expanded(
            child: TextFormField(
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter transaction title'),
          validator: isEmptyStringValidator(),
          onChanged: (String value) {
            setState(() {
              _title = value;
            });
          },
        )),
      ],
    );
  }

  Row descriptionRow() {
    return Row(
      children: [
        label('Description:'),
        Expanded(
            child: TextFormField(
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter transaction description'),
          validator: isEmptyStringValidator(),
          onChanged: (String value) {
            setState(() {
              _description = value;
            });
          },
        )),
      ],
    );
  }

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _transactionDate,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(3000, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _transactionDate = newDate;
        _transactionDateTextController.text = _dateFormat.format(newDate);
      });
    }
  }

  SizedBox label(String labelText) {
    return SizedBox(
        width: 200,
        child: Text(
          labelText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textScaleFactor: 1.3,
        ));
  }

  Row bottomButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //TODO: This result should called via parent callback function
                        final transaction = Transaction(_title, _amount,
                            _currency, _transactionDate, _account,
                            description: _description);
                        debugPrint(transaction.toString());
                      }
                    },
                    child: const Text('Add')))),
        Expanded(
            child: Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))))
      ],
    );
  }
}
