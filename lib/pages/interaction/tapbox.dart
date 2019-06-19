import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class TapboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBox'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[_TapBoxA(), _TapBoxBParent(), _TapBoxCParent()],
        ),
      ),
    );
  }
}

// 状态存在自身内部
class _TapBoxA extends StatefulWidget {
  _TapBoxA({Key key}) : super(key: key);
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<_TapBoxA> {
  bool _active = false;
  void _onTap() {
    setState(() {
      _active = !_active;
    }); // 通知框架重绘组件
  }

  Widget build(BuildContext context) {
    // 检测手势
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          _active ? 'Actice' : 'Inactive',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        width: 150,
        height: 150,
        // 背景色
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.lightGreen[500]),
      ),
    );
  }
}

// 状态存放在父组件
class _TapBoxBParent extends StatefulWidget {
  @override
  _TapBoxBParentState createState() => _TapBoxBParentState();
}

class _TapBoxBParentState extends State<_TapBoxBParent> {
  bool _active = false;

  void _onChanged(bool val) {
    setState(() {
      _active = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _TapBoxB(active: _active, onChanged: _onChanged),
    );
  }
}
// 状态都放在父组件，所以该组件是无状态
class _TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  // @required表示必传
  _TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _onTap() {
    onChanged(!active); // 父组件传递进来的
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          active ? 'Active' : 'Inactive',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[500],
        ),
      ),
    );
  }
}
// 部分状态放在父组件，部分状态放在组件自身内部
class _TapBoxCParent extends StatefulWidget {
  @override
  _TapBoxCParentState createState() => _TapBoxCParentState();
}

class _TapBoxCParentState extends State<_TapBoxCParent> {
  bool _active = false;

  void _onChanged(bool val) {
    setState(() {
      _active = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _TapBoxC(active: _active, onChanged: _onChanged),
    );
  }
}

class _TapBoxC extends StatefulWidget {
  final bool active; // 来自父组件
  final ValueChanged<bool> onChanged; // 来自父组件

  _TapBoxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  // 部分状态放在组件自身内部
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<_TapBoxC> {
  bool _highlight = false; // 存放在自身内部

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _onTap() {
    widget.onChanged(!widget.active); // 通过widget调用父组件传递给自身的
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: _onTap,
      onTapCancel: _onTapCancel,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.active ? 'Active' : 'Inactive',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[500],
          border: _highlight ? Border.all(color: Colors.teal[700], width: 10) : null,
        ),
      ),
    );
  }
}
