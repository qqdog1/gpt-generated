import 'package:flutter/material.dart';

class DiaryEntry {
  DateTime dateTime;
  String description;
  String? imagePath;

  DiaryEntry({required this.dateTime, required this.description, this.imagePath});
}