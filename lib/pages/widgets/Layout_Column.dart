import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ColumnPage extends StatefulWidget {
  @override
  _ColumnState createState() => _ColumnState();
}

class _ColumnState extends State<ColumnPage> {
  final String _titleText = 'Column';
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
          /// mainAxisAlignment属性 - 主轴对齐方式
          /// MainAxisAlignment.spaceEvenly/spaceAround/spaceBetween
          ///  - spaceEvenly    主轴方向剩余空间均分，使得child之间空间相等，包括首尾child
          ///  - spaceAround    主轴方向剩余空间均分，使得child之间空间相等，首尾child与父容器边界空间分为一半
          ///  - spaceBetween   主轴方向剩余空间均分，使得child之间空间相等，首尾child靠近边界，无空间
          /// MainAxisAlignment.start/center/end
          ///  - start    各child排列在主轴起始位置
          ///  - center   各child排列在主轴中央位置
          ///  - end      各child排列在主轴结尾位置
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          /// crossAxisAlignment属性 - 交叉轴对齐方式
          /// CrossAxisAlignment.start/center/end
          ///  - start    child在交叉轴上排列在交叉轴起始位置
          ///  - center   child在交叉轴上排列在交叉轴中央位置
          ///  - end      child在交叉轴上排列在交叉轴中央位置
          /// CrossAxisAlignment.stretch/baseline
          ///  - stretch  child在交叉轴上完全填充至父容器边界
          ///  - baseline child在交叉轴上基于baseline对齐，若主轴是垂直的，那么这个值即起始点
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.blueGrey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}
