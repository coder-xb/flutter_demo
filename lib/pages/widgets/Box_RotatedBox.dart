import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class RotatedBoxPage extends StatefulWidget {
  @override
  _RotatedBoxState createState() => _RotatedBoxState();
}

class _RotatedBoxState extends State<RotatedBoxPage> {
  final String _titleText = 'RotatedBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body:  Center(
          child: Column(
            children: <Widget>[
              // quarterTurns 旋转次数 次/90度
              RotatedBox(
                child: Text('RotatedBox A - 0'),
                quarterTurns: 0,
              ),
              RotatedBox(
                child: Text('RotatedBox A - 1'),
                quarterTurns: 1,
              ),
              RotatedBox(
                child: Text('RotatedBox B - 2'),
                quarterTurns: 2,
              ),
              RotatedBox(
                child: Text('RotatedBox B - 3'),
                quarterTurns: 3,
              ),
              RotatedBox(
                child: Text('RotatedBox B - 4'),
                quarterTurns: 4,
              ),
            ],
          )
      ),
    );
  }
}
