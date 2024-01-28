import 'package:flutter/material.dart';
import 'package:allergen_avoider/allergen.dart';
import 'package:allergen_avoider/allergen_form.dart';

class AllergenList extends StatefulWidget {
  @override
  _AllergenListState createState() => _AllergenListState();
}

class _AllergenListState extends State<AllergenList> {
  List<Allergen> allergens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Allergen List'),
      ),
      body: ListView.builder(
        itemCount: allergens.length,
        itemBuilder: (context, index) {
          final allergen = allergens[index];
          return ListTile(
            title: Text(allergen.name),
            tileColor: allergen.getBackgroundColor(),
            onTap: () {
              // Navigate to allergen form to edit
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllergenForm(allergen: allergen),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to allergen form to add new
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllergenForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}