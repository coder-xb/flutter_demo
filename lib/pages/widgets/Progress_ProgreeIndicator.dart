import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ProgressIndicatorPage extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicatorPage> {
  final String _titleText = 'ProgressIndicator';
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
          children: <Widget>[
            CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            LinearProgressIndicator(
              // 背景色
              backgroundColor: Colors.blueGrey,
              // 进度值的颜色
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              // 进度值
              value: .3,
            ),
          ],
        ),
      ),
    );
  }
}
