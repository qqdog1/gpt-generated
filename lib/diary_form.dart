import 'package:flutter/material.dart';
import 'package:allergen_avoider/diary_entry.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DiaryForm extends StatefulWidget {
  final DiaryEntry? entry;

  DiaryForm({this.entry});

  @override
  _DiaryFormState createState() => _DiaryFormState();
}

class _DiaryFormState extends State<DiaryForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    if (widget.entry != null) {
      _descriptionController.text = widget.entry!.description;
      _dateTime = widget.entry!.dateTime;
      _imagePath = widget.entry!.imagePath;
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry == null ? 'Add Diary Entry' : 'Edit Diary Entry'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              if (_imagePath != null) Image.file(File(_imagePath!)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save diary entry
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