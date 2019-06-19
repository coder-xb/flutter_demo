import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class PopupMenuButtonPage extends StatefulWidget {
  @override
  _PopupMenuButtonState createState() => _PopupMenuButtonState();
}

class _PopupMenuButtonState extends State<PopupMenuButtonPage> {
  final String _titleText = 'PopupMenuButton';
  int _val = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: ListTile(
          title: Text(_titleText),
          trailing: PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            onSelected: (int v) {
              print(v);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('LOCK'),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('HANGUP'),
                ),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: ListTile(
                  leading: Icon(Icons.volume_off),
                  title: Text('MUTE'),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 4,
                child: ListTile(
                  leading: Icon(Icons.remove_from_queue),
                  title: Text('OVER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
