import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class CheckBoxListTilePage extends StatefulWidget {
  @override
  _CheckBoxListTileState createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<CheckBoxListTilePage> {
  final String _titleText = 'CheckBoxListTile';
  bool _val = false;

  void _valChanged(bool val) {
    setState(() {
      _val = val;
      for(int i = 0, len = _checks.length; i < len; i++) {
        _checks[i] = val;
      }
    });
  }
  List<bool> _checks = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              // 选中时的背景(不包含图标)颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: _val,
              // 默认文字是否高亮
              selected: true,
              // 切换时回调
              onChanged: _valChanged,
              // 文字是否对齐图标高度
              dense: false,
              // 文字是否三行显示
              isThreeLine: false,
              // 主标题
              title: Text(_titleText),
              // 副标题
              subtitle: Text(_titleText),

              /// 将控件放在相对于文本的什么位置
              /// leading 控件在文字前
              /// trailing,platform 控件在文字后
              controlAffinity: ListTileControlAffinity.platform,
              // 与控件位置相反位置的小图标
              secondary: Icon(Icons.add),
            ),
            CheckboxListTile(
              // 选中时的背景(不包含图标)颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: _checks[0],
              // 默认文字是否高亮
              selected: true,
              // 切换时回调
              onChanged: (bool val) {
                setState(() {
                  _checks[0] = val;
                });
              },
              // 文字是否对齐图标高度
              dense: false,
              // 文字是否三行显示
              isThreeLine: false,
              // 主标题
              title: Text(_titleText),
              // 副标题
              subtitle: Text(_titleText),

              /// 将控件放在相对于文本的什么位置
              /// leading 控件在文字前
              /// trailing,platform 控件在文字后
              controlAffinity: ListTileControlAffinity.platform,
              // 与控件位置相反位置的小图标
              secondary: Icon(Icons.add),
            ),
            CheckboxListTile(
              // 选中时的背景(不包含图标)颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: _checks[1],
              // 默认文字是否高亮
              selected: true,
              // 切换时回调
              onChanged: (bool val) {
                setState(() {
                  _checks[1] = val;
                });
              },
              // 文字是否对齐图标高度
              dense: false,
              // 文字是否三行显示
              isThreeLine: false,
              // 主标题
              title: Text(_titleText),
              // 副标题
              subtitle: Text(_titleText),

              /// 将控件放在相对于文本的什么位置
              /// leading 控件在文字前
              /// trailing,platform 控件在文字后
              controlAffinity: ListTileControlAffinity.platform,
              // 与控件位置相反位置的小图标
              secondary: Icon(Icons.add),
            ),
            CheckboxListTile(
              // 选中时的背景(不包含图标)颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: _checks[2],
              // 默认文字是否高亮
              selected: true,
              // 切换时回调
              onChanged: (bool val) {
                setState(() {
                  _checks[2] = val;
                });
              },
              // 文字是否对齐图标高度
              dense: false,
              // 文字是否三行显示
              isThreeLine: false,
              // 主标题
              title: Text(_titleText),
              // 副标题
              subtitle: Text(_titleText),

              /// 将控件放在相对于文本的什么位置
              /// leading 控件在文字前
              /// trailing,platform 控件在文字后
              controlAffinity: ListTileControlAffinity.platform,
              // 与控件位置相反位置的小图标
              secondary: Icon(Icons.add),
            ),
            CheckboxListTile(
              // 选中时的背景(不包含图标)颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: _checks[3],
              // 默认文字是否高亮
              selected: true,
              // 切换时回调
              onChanged: (bool val) {
                setState(() {
                  _checks[3] = val;
                });
              },
              // 文字是否对齐图标高度
              dense: false,
              // 文字是否三行显示
              isThreeLine: false,
              // 主标题
              title: Text(_titleText),
              // 副标题
              subtitle: Text(_titleText),

              /// 将控件放在相对于文本的什么位置
              /// leading 控件在文字前
              /// trailing,platform 控件在文字后
              controlAffinity: ListTileControlAffinity.platform,
              // 与控件位置相反位置的小图标
              secondary: Icon(Icons.add),
            ),
            CheckboxListTile(
              // 选中时的背景(不包含图标)颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: _checks[4],
              // 默认文字是否高亮
              selected: true,
              // 切换时回调
              onChanged: (bool val) {
                setState(() {
                  _checks[4] = val;
                });
              },
              // 文字是否对齐图标高度
              dense: false,
              // 文字是否三行显示
              isThreeLine: false,
              // 主标题
              title: Text(_titleText),
              // 副标题
              subtitle: Text(_titleText),

              /// 将控件放在相对于文本的什么位置
              /// leading 控件在文字前
              /// trailing,platform 控件在文字后
              controlAffinity: ListTileControlAffinity.platform,
              // 与控件位置相反位置的小图标
              secondary: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
