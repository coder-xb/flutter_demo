import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class AnimatedPaddingPage extends StatefulWidget {
  @override
  _AnimatedPaddingState createState() => _AnimatedPaddingState();
}

class _AnimatedPaddingState extends State<AnimatedPaddingPage> {
  final String _titleText = 'AnimatedPadding';
  double _padVal = 10;
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
            Container(
              width: 300,
              height: 300,
              color: Colors.blueGrey,
              child: AnimatedPadding(
                // 均衡的间距
                padding: EdgeInsets.symmetric(
                  vertical: _padVal,
                  horizontal: _padVal,
                ),
                // 动画时长
                duration: Duration(milliseconds: 1000),
                // 动画曲线
                curve: Curves.easeIn,
                child: Container(
                  width: 200,
                  color: Colors.green,
                ),
              ),
            ),
            RaisedButton(
              child: Text('CLICK'),
              onPressed: () {
                setState(() {
                  if (_padVal == 10) {
                    _padVal = 100;
                  } else {
                    _padVal = 10;
                  }
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}
