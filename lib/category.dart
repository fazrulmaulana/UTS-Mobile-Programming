

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text('Category'),

        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => EntryItem(
            data[index],
          ),
        ),
      ),
    );
  }
}

// Welcome to another flutter tutorial
// In this video we will see how to create a multi-level Expansion List
// First Let's create a class for each row in the Expansion List

class Entry {
  final String title;
  final List<Entry>
  children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> data = <Entry>[
  Entry(
    'Men',
    <Entry>[
      Entry(
        'Top',
        <Entry>[
          Entry('Black Hoodie'),
          Entry('Grey Hoodie'),
          Entry('White Hoodie'),
        ],
      ),
      Entry('Bottom'),
    ],
  ),
  // Second Row
  Entry('Woman', <Entry>[
    Entry('Top'),
    Entry('Bottom'),
  ]),
  Entry(
    'Shoes',
    <Entry>[
      Entry('Formal'),
      Entry('Sneakers'),
      Entry(
        'Sneakerss',
        <Entry>[
          Entry('Air Jordan 1'),
          Entry('Air Jordan 2'),
          Entry('Air Jordan 3'),
          Entry('Air Jordan 4'),
        ],
      )
    ],
  ),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}