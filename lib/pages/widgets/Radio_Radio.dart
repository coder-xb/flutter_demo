import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<RadioPage> {
  final String _titleText = 'Radio';
  int gVal = 1;
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
            Radio(
              activeColor: Colors.blueGrey, // 选中时的颜色
              value: 1, // 选中的值
              groupValue: gVal, // 当value与groupValue一致时选中
              onChanged: (int v) {
                this.setState(() {
                  gVal = v;
                });
              },
            ),
            Radio(
              value: 2,
              activeColor: Colors.blueGrey,
              groupValue: gVal,
              onChanged: (int v) {
                this.setState(() {
                  gVal = v;
                });
              },
            ),
            Radio(
              value: 3,
              activeColor: Colors.blueGrey,
              groupValue: gVal,
              onChanged: (int v) {
                this.setState(() {
                  gVal = v;
                });
              },
            ),
            Radio(
              value: 4,
              activeColor: Colors.blueGrey,
              groupValue: gVal,
              onChanged: (int v) {
                this.setState(() {
                  gVal = v;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
