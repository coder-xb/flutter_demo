import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggableState createState() => _DraggableState();
}

class _DraggableState extends State<DraggablePage> {
  Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Draggable'),
        centerTitle: true,
      ),*/
      drawer: AppDrawer(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _DraggableWidget(
              offset: Offset(100, 100),
              color: Colors.blueGrey,
            ),
            _DraggableWidget(
              offset: Offset(200, 100),
              color: Colors.teal,
            ),
            Center(
              child: DragTarget(
                onAccept: (Color color) {
                  _color = color;
                },
                builder: (BuildContext context, candidateData, rejectedData) =>
                    Container(
                      width: 200,
                      height: 200,
                      color: _color,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 可拖动(且可获取位置信息)的组件 Draggable
/// Positioned 组件能够根据偏移量offset进行定位
/// Draggable 的 child 属性是拖动前的 组件样子
/// Draggable 的 feedback 属性是拖动时的 组件样子
/// Draggable 的 data 属性是在拖动到 DragTarget 将会传递的参数数据
/// 在 DragTarget 中的 onAccept 方法可以接收到上述 data
/// 注：Draggable 此组件会与 Appbar 产生干扰   导致offset信息获取有误
/// 拖拽结束时会调用 onDraggableCanceled 方法，该方法会回调组件此时的偏移量offset
class _DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color color;
  const _DraggableWidget({
    Key key,
    this.offset,
    this.color,
  }) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<_DraggableWidget> {
  Offset _offset = Offset(0.0, 0.0);

  @override
  void initState() {
    _offset = widget.offset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
        data: widget.color,
        child: Container(
          width: 100,
          height: 100,
          color: widget.color,
        ),
        // 拖动时反馈的样式
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.color.withOpacity(.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this._offset = offset;
          });
        },
      ),
    );
  }
}
