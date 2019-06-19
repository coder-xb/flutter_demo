import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class SwitchListTilePage extends StatefulWidget {
  @override
  _SwitchListTileState createState() => _SwitchListTileState();
}

class _SwitchListTileState extends State<SwitchListTilePage> {
  final String _titleText = 'SwitchListTile';
  bool _check = false;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _check,
              onChanged: (bool val) {
                setState(() {
                  _check = val;
                });
              },
              // 主标题
              title: Text(_titleText),
              // 子标题
              subtitle: Text(_titleText),
              // 附加图标
              secondary: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
