import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class RadioListTilePage extends StatefulWidget {
  @override
  _RadioListTileState createState() => _RadioListTileState();
}

class _RadioListTileState extends State<RadioListTilePage> {
  final String _titleText = 'RadioListTile';
  int _val = 1;

  void _onChange(int v) {
    this.setState(() {
      _val = v;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadioListTile<int>(
              title: Text('Monday'),
              value: 1,
              groupValue: _val,
              secondary: Icon(Icons.print), // 右侧图标
              subtitle: Text('Monday'),
              onChanged: _onChange,
            ),
            RadioListTile<int>(
              title: Text('Tuesday'),
              value: 2,
              groupValue: _val,
              subtitle: Text('Tuesday'),
              onChanged: _onChange,
            )
          ],
        ),
      ),
    );
  }
}
