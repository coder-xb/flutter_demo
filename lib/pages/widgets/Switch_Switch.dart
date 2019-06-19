import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<SwitchPage> {
  final String _titleText = 'Switch';
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
            // 一般用法
            Switch(
              // Switch是否开启
              value: _check,
              // 按钮开启时按钮的颜色
              activeColor: Colors.blueGrey,
              // 按钮开启时滑轨的颜色
              activeTrackColor: Colors.yellow,
              // 按钮开启时按钮的图片
              // activeThumbImage: ,
              // 按钮关闭时原点的颜色
              inactiveThumbColor: Colors.green,
              // 按钮关闭时滑轨的背景色
              inactiveTrackColor: Colors.black26,
              // 按钮关闭时按钮的图片
              // inactiveThumbImage: ,


              // 监听切换事件
              onChanged: (bool val) {
                setState(() {
                  _check = !_check;
                });
              },
            ),
            // adaptive方法创建
            Switch.adaptive(
              // Switch是否开启
              value: _check,
              // 监听切换事件
              onChanged: (bool val) {
                setState(() {
                  _check = !_check;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
