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
  final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  final _formKey = GlobalKey<FormState>();

  String _accountValue = 'Nordea';
  String _budgetName = 'April 2022';
  DateTime _transactionDate = DateTime.now();
  String _defaultCurrency = 'DKK';

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
            sumRow(),
            titleRow(),
            descriptionRow()
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //TODO: Add add logic
                          debugPrint('Valid, add logic here');
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
      ),
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
          value: _accountValue,
          isExpanded: true,
          items: <String>['Nordea', 'Wallet']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _accountValue = newValue!;
            });
          },
          validator: isEmptyStringValidator(),
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
          value: _budgetName,
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
              _budgetName = newValue!;
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

  Row sumRow() {
    return Row(
      children: [
        label('Sum:'),
        Expanded(
            child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
          ],
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter transaction sum'),
          validator: isEmptyStringValidator(),
        )),
        DropdownButton(
            value: _defaultCurrency,
            items: <String>['DKK', 'USD']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _defaultCurrency = newValue!;
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
        _transactionDateTextController.text = dateFormat.format(newDate);
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
}
