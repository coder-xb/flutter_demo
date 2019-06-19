import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarPage> {
  final String _titleText = 'BottomNavigationBar';
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        // 底部按钮类型
        // BottomNavigationBarType.fixed 按钮位置固定
        // BottomNavigationBarType.shifting 按钮可以移位(通过移位来突出当前项)
        type: BottomNavigationBarType.fixed,
        // 图标大小
        iconSize: 24,
        // 点击回调
        onTap: _onItemTabed,
        // 当前选中项索引 高亮显示
        currentIndex: _curIndex,
        // 当类型为fixed时的选中项颜色
        // fixedColor: Colors.black,
        // 背景色
        // backgroundColor: Colors.blueGrey,
        // 当前选中项颜色
        // selectedItemColor: Colors.white,
        // 当前未选中项颜色
        // unselectedItemColor: Colors.black26,
        // 当前选中项的文本大小
        // selectedFontSize: 10,
        // 当前未选中项的文本大小
        // unselectedFontSize: 5,
        // 是否显示未选中项的文本
        // showUnselectedLabels: false,
        // 是否显示当前选中项的文本
        // showSelectedLabels: false,
        // elevation: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('HOME'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('MESSAGE'), icon: Icon(Icons.message)),
          BottomNavigationBarItem(title: Text('MEMBER'), icon: Icon(Icons.person)),
        ],
      ),
    );
  }

  void _onItemTabed(int index) {
    setState(() {
      _curIndex = index;
    });
  }
}
