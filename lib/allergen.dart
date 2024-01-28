import 'package:flutter/material.dart';

enum Severity { safe, mild, severe, dangerous }

class Allergen {
  String name;
  Severity severity;

  Allergen({required this.name, required this.severity});

  Color getBackgroundColor() {
    switch (severity) {
      case Severity.safe:
        return Colors.green;
      case Severity.mild:
        return Colors.yellow;
      case Severity.severe:
        return Colors.orange;
      case Severity.dangerous:
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}