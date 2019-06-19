import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class CenterPage extends StatefulWidget {
  @override
  _CenterState createState() => _CenterState();
}

class _CenterState extends State<CenterPage> {
  final String _titleText = 'Center';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          color: Colors.blueGrey,
          child: Center(
            child: Text(_titleText,
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
