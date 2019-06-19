import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class AlignPage extends StatefulWidget {
  @override
  _AlignState createState() => _AlignState();
}

class _AlignState extends State<AlignPage> {
  final String _titleText = 'Align';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.blueGrey,
        width: 200,
        height: 200,
        child: Align(
          // 宽高填充的系数(n倍)
          // widthFactor: 2.0,
          // heightFactor: 3.0,
          /// alignment子组件对齐方式
          /// 指定所有子组件的对齐方式，只有两个子组件的时候使用，
          /// 如果有三个及以上的子组件时，官方推荐使用Positioned包裹子组件来决定子组件的位置
          /// alignment属性值可以取值（注:Alignment.topLeft === AlignmentDirectional.topStart etc...）
          /// Alignment(AlignmentDirectional).topLeft(.topStart)            垂直顶部水平左对齐
          /// Alignment(AlignmentDirectional).topCenter(.topCenter)         垂直顶部水平中对齐
          /// Alignment(AlignmentDirectional).topRight(.topEnd)             垂直顶部水平右对齐
          /// Alignment(AlignmentDirectional).centerLeft(.centerStart)      垂直居中水平左对齐
          /// Alignment(AlignmentDirectional).center(.center)               垂直居中水平中对齐
          /// Alignment(AlignmentDirectional).centerRight(.centerEnd)       垂直居中水平右对齐
          /// Alignment(AlignmentDirectional).bottomLeft(.bottomStart)      垂直底部水平左对齐
          /// Alignment(AlignmentDirectional).bottomCenter(.bottomCenter)   垂直底部水平中对齐
          /// Alignment(AlignmentDirectional).bottomRight(.bottomEnd)       垂直底部水平右对齐
          /// 也可以指定具体的偏移量，以整个父组件的中心点为坐标原点，
          /// x,y偏移量取值范围[-1,1]：Alignment(x,y) / AlignmentDirectional(x,y)
          /// 若 x > 0，则表示向右偏移，若 x < 0，则表示向左偏移；
          /// 若 y > 0，则表示向下偏移，若 y < 0，则表示向上偏移。
          alignment: Alignment.center,
          child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Text('center'),
          ),
        ),
      ),
    );
  }
}
