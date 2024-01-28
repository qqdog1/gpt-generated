import 'package:flutter/material.dart';
import 'package:allergen_avoider/allergen.dart';

class AllergenForm extends StatefulWidget {
  final Allergen? allergen;

  AllergenForm({this.allergen});

  @override
  _AllergenFormState createState() => _AllergenFormState();
}

class _AllergenFormState extends State<AllergenForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  Severity _severity = Severity.safe;

  @override
  void initState() {
    super.initState();
    if (widget.allergen != null) {
      _nameController.text = widget.allergen!.name;
      _severity = widget.allergen!.severity;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.allergen == null ? 'Add Allergen' : 'Edit Allergen'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Allergen Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter allergen name';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<Severity>(
                value: _severity,
                onChanged: (Severity? newValue) {
                  setState(() {
                    _severity = newValue!;
                  });
                },
                items: Severity.values.map<DropdownMenuItem<Severity>>((Severity value) {
                  return DropdownMenuItem<Severity>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Severity'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save allergen
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}