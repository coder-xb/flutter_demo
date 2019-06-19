import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class DropdownMenuItemPage extends StatefulWidget {
  @override
  _DropdownMenuItemState createState() => _DropdownMenuItemState();
}

class _DropdownMenuItemState extends State<DropdownMenuItemPage> {
  final String _titleText = 'DropdownMenuItem';
  int _val = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: ListTile(
          title: Text(_titleText),
          trailing: DropdownButton(
            value: _val,
            onChanged: (int val) {
              setState(() {
                _val = val;
              });
            },
            items: <int>[1, 2, 3, 4, 5, 6]
                .map<DropdownMenuItem<int>>(
                  (int v) => DropdownMenuItem<int>(
                        value: v,
                        child: Text('Item $v'),
                      ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
