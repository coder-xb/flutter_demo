import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class DismissiblePage extends StatefulWidget {
  @override
  _DismissibleState createState() => _DismissibleState();
}

class _DismissibleState extends State<DismissiblePage> {
  final String _titleText = 'Dismissible';
  final List<String> items = List<String>.generate(30, (i) => 'Items ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('$item has been deleted！Sliding direction： $direction'),
              ));
            },
            child: ListTile(
              title: Text('$item'),
            ),
          );
        },
      ),
    );
  }
}
