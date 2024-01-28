import 'package:flutter/material.dart';
import 'package:allergen_avoider/allergen_list.dart';

void main() {
  runApp(AllergenAvoiderApp());
}

class AllergenAvoiderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allergen Avoider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AllergenList(),
    );
  }
}