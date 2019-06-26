import 'dart:math';
import '../utils/rect_getter.dart';
import 'package:flutter/material.dart';

typedef TouchCallBack = void Function(double r);
enum Style { Touch, Rotate }

// 旋转按钮
class RotateButton extends StatefulWidget {
  // 距离屏幕顶部距离
  final double dx;
  // 距离屏幕左边距离
  final double dy;

  // 返回数据
  final TouchCallBack getAngle;
  final Style style;
  final bool getBackCenter;

  RotateButton({
    @required this.getAngle,
    @required this.dx,
    @required this.dy,
    this.style,
    this.getBackCenter,
  });

  @override
  _RotateButtonState createState() => _RotateButtonState();
}

class _RotateButtonState extends State<RotateButton> {
  // 获取空间位置的key
  GlobalKey _key = RectGetter.createGlobalKey();
  // 组件中心点
  Offset _centerOffset;
  // 用户触摸点
  Offset _currentOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 250, width: 250),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/icon_control.png'),
          fit: BoxFit.cover,
        ),
        color: Colors.white.withOpacity(.8),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black.withOpacity(.3),
        ),
      ),
      child: RectGetter(
        key: _key,
        child: Center(
          child: GestureDetector(
            onScaleUpdate: _onUserTouch,
            // 用户手离开之后出发，让小圆点回归中心
            onScaleEnd: (_) => widget.getBackCenter != null
                ? widget.getBackCenter ? _getBackCenter() : {}
                : {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              clipBehavior: Clip.antiAlias,
              child: Container(
                constraints: BoxConstraints.tightFor(height: 200, width: 200),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: <Widget>[
                    _currentOffset != null
                        ? Positioned(
                            top: _currentOffset.dy - 100,
                            left: _currentOffset.dx - 100,
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/icon_point.png'),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 根据用户触摸点以及中心点计算得到边缘位置，进而旋转按钮
  Offset _changeOffset(double x1, double x2, double y1, double y2) {
    final x = x2 - x1, y = y1 - y2, g = 80 / sqrt(x * x + y * y);
    if (x >= 0 && y >= 0) {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    } else if (x <= 0 && y >= 0) {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    } else if (x <= 0 && y <= 0) {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    } else {
      return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
    }
    // return Offset(x1.abs() + x * g.abs(), y1.abs() - y * g.abs());
  }

  // 在用户手离开后让小圆点回归中心点
  void _getBackCenter() {
    final _offset = _currentOffset = _getCenterOffset(_key);
    setState(() {
      _currentOffset = _offset;
    });
  }

  // 获取中心点
  Offset _getCenterOffset(GlobalKey key) {
    Offset _center = RectGetter.getRectFormKey(key).center;
    return Offset(_center.dx - widget.dx + 30, _center.dy - widget.dy + 20);
  }

  // 获取用户触摸点
  Offset _getCurrentOffset(ScaleUpdateDetails details) {
    Offset _tap = details.focalPoint;
    return Offset(_tap.dx - widget.dx + 30, _tap.dy - widget.dy + 20);
  }

  // 角度计算
  double _getAngle(double x1, double x2, double y1, double y2) {
    double _angle = 0.0;
    final double _dx = x2 - x1, _dy = y2 - y1;

    if (x2 == x1) {
      _angle = pi / 2;
      if (y1 == y2)
        _angle = 0.0;
      else if (y2 < y1) _angle = 3 * pi / 2;
    } else if (x2 > x1 && y2 > y1) {
      _angle = atan(_dx / _dy);
    } else if (x2 > x1 && y2 < y1) {
      _angle = pi / 2 + atan(-_dy / _dy);
    } else if (x2 < x1 && y2 < y1) {
      _angle = pi + atan(_dx / _dy);
    } else if (x2 < x1 && y2 > y1) _angle = 3 * pi / 2 + atan(_dy / -_dx);
    return _angle * 180 / pi;
  }

  // 用户触摸时
  void _onUserTouch(ScaleUpdateDetails details) {
    final Offset _curOffset = _getCurrentOffset(details);
    final Offset _cenOffset = _getCenterOffset(_key);

    // 控制触摸方式
    if (widget.style == null) {
      _currentOffset = _changeOffset(
        _cenOffset.dx,
        _curOffset.dx,
        _cenOffset.dy,
        _curOffset.dy,
      );
    } else {
      widget.style == Style.Touch
          ? _currentOffset = _curOffset
          : _currentOffset = _changeOffset(
              _cenOffset.dx,
              _curOffset.dx,
              _cenOffset.dy,
              _curOffset.dy,
            );
    }

    // 获取旋转角度
    if (widget.getAngle != null) {
      double angle = _getAngle(
        _cenOffset.dx,
        _curOffset.dx,
        _cenOffset.dy,
        _curOffset.dy,
      );
      widget.getAngle(angle);
    }

    // 防止触摸超出界面边界
    double spacing = sqrt(
        (_cenOffset.dx - _curOffset.dx) * (_cenOffset.dx - _curOffset.dx) +
            (_cenOffset.dy - _curOffset.dy) * (_cenOffset.dy - _curOffset.dy));

    if (spacing > 90)
      _currentOffset = _changeOffset(
          _cenOffset.dx, _curOffset.dx, _cenOffset.dy, _curOffset.dy);
    setState(() {});
  }
}
