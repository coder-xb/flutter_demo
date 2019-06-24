import 'package:flutter/material.dart';
import '../../widgets/index.dart';

/// 使用贝塞尔二阶曲线切割组件
/// ClipPath能够让我们使用clipper切割其子组件
/// ClipPath 需要两个参数： clipper 和 child
/// clipper：接收一个CustomClipper<Path>对象，ClipPath组件使用此Path来切割child外的任何内容
class CustomClipperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomClipper'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: _BottomClipper(),
            child: Container(
              color: Colors.blueGrey,
              height: 400,
              child: Center(
                child: Text(
                  '贝塞尔二阶曲线切割子组件',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    ///  整条线包括 两条直线 和 一跳贝塞尔二阶曲线
    ///  (0,0) => (0, size.height - 100)  从起点向下的一条直线
    ///  贝塞尔二阶曲线: (0, size.height - 100) --起点
    ///                   => size.width / 4, size.height -- 最低点
    ///                   => size.width / 2, size.height - 100 -- 中间位置
    ///                   => size.width / 4 * 3, size.height - 200 -- 最高点
    ///                   => size.width, size.height - 100 -- 曲线终点
    ///  size.width, size.height - 100 => size.width, 0 从贝塞尔二阶曲线终点向上的一条直线
    Path _path = Path(); // 默认起点在左上角(0,0)，整条线的起点
    _path.lineTo(0, size.height - 100); // 曲线起点
    Offset _firstControlPoint = Offset(size.width / 4, size.height); // 曲线最低点
    Offset _firstEndPoint = Offset(size.width / 2, size.height - 100); // 曲线中间位置
    // 进行 贝塞尔二阶曲线 绘制
    _path.quadraticBezierTo(
      _firstControlPoint.dx,
      _firstControlPoint.dy,
      _firstEndPoint.dx,
      _firstEndPoint.dy,
    );

    Offset _sencondControlPoint =
        Offset(size.width / 4 * 3, size.height - 200); // 曲线最高点
    Offset _sencondEndPoint = Offset(size.width, size.height - 100); // 曲线终点
    // 进行 贝塞尔二阶曲线 绘制
    _path.quadraticBezierTo(
      _sencondControlPoint.dx,
      _sencondControlPoint.dy,
      _sencondEndPoint.dx,
      _sencondEndPoint.dy,
    );

     _path.lineTo(size.width, 0); // 整条线的终点
    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
