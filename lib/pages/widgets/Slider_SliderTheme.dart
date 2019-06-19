import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class SliderThemePage extends StatefulWidget {
  @override
  _SliderThemeState createState() => _SliderThemeState();
}

class _SliderThemeState extends State<SliderThemePage> {
  final String _titleText = 'SliderTheme';
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
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            // 已拖动的进度颜色
              activeTrackColor: Colors.yellowAccent,
              // 未拖动的进度颜色
              inactiveTrackColor: Colors.red,
              // 提示进度的气泡背景色
              valueIndicatorColor: Colors.blueGrey,
              // 提示进度的气泡文本样式
              valueIndicatorTextStyle: TextStyle(
                  color: Colors.blue
              ),
              // 滑块中心的颜色
              thumbColor: Colors.white,
              // 滑块边缘的颜色
              overlayColor: Colors.red,
              // divisions对进度线进行分割后，断续线中间的间隔色
              inactiveTickMarkColor: Colors.white
          ),
          child: Slider(
            value: _val,
            label: '$_val',
            min: 0,
            max: 100,
            divisions: 10,
            onChanged: (double v) {
              setState(() {
                _val = v.floorToDouble();
              });
            },
          ),
        ),
      ),
    );
  }
}
