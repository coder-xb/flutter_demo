import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class OverflowBoxPage extends StatefulWidget {
  @override
  _OverflowBoxState createState() => _OverflowBoxState();
}

class _OverflowBoxState extends State<OverflowBoxPage> {
  final String _titleText = 'OverflowBox';
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
          color: Colors.blueGrey,
          width: 200,
          height: 200,
          padding: EdgeInsets.all(5),
          // 溢出容器
          child: OverflowBox(
            // 对齐方式
            alignment: Alignment.topLeft,
            // 限定溢出最大宽高
            maxWidth: 300,
            maxHeight: 300,
            child: Container(
              color: Colors.black26,
              width: 300,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}
