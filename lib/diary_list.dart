import 'package:flutter/material.dart';
import 'package:allergen_avoider/diary_entry.dart';
import 'package:allergen_avoider/diary_form.dart';

class DiaryList extends StatefulWidget {
  @override
  _DiaryListState createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  List<DiaryEntry> diaryEntries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary List'),
      ),
      body: ListView.builder(
        itemCount: diaryEntries.length,
        itemBuilder: (context, index) {
          final entry = diaryEntries[index];
          return ListTile(
            title: Text(entry.description),
            subtitle: Text(entry.dateTime.toString()),
            onTap: () {
              // Navigate to diary form to edit
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiaryForm(entry: entry),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to diary form to add new
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DiaryForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}