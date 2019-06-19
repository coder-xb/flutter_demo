import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

int _selectVal = 1;
class DropdownButtonPage extends StatefulWidget {
  @override
  _DropdownButtonState createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButtonPage> {
  final String _titleText = 'DropdownButton';
  final List<DropdownMenuItem> _btnItms = <DropdownMenuItem>[
    DropdownMenuItem(child: Text('OPTION_1'), value: 1),
    DropdownMenuItem(child: Text('OPTION_2'), value: 2),
    DropdownMenuItem(child: Text('OPTION_3'), value: 3),
    DropdownMenuItem(child: Text('OPTION_4'), value: 4),
    DropdownMenuItem(child: Text('OPTION_5'), value: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: DropdownButton(
          // 提示内容 文本
          hint: Text('SELECT'),
          // 下拉列表数据
          items: _btnItms,
          // 默认值
          value: _selectVal,
          // 图标大小
          iconSize: 24,
          // 下拉列表文本样式
          style: TextStyle(
            color: Colors.red,
          ),
          // 阴影高度
          elevation: 24,
          // 是否将设置和父容器一样大小，水平填充成父级
          isExpanded: true,
          // 数据改变时
          onChanged: (val) {
            print(val);
          },
        ),
      ),
    );
  }
}
