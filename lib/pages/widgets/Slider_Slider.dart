import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<SliderPage> {
  final String _titleText = 'Slider';
  double _val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Slider(
          // 实际进度值
          value: _val,
          min: 0,
          max: 100,
          // 分量个数，划分
          divisions: 100,
          label: 'The current progress value is：$_val',
          // 活动中的背景色
          activeColor: Colors.green,
          // 未活动中的背景色
          inactiveColor: Colors.black,
          onChanged: (double v) {
            setState(() {
              _val = v;
            });
          },
          onChangeEnd: (double v) {
            print(v);
          },
          onChangeStart: (double v) {
            print(v);
          },
        ),
      ),
    );
  }
}
