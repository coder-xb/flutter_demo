import 'package:flutter/material.dart';
import '../../widgets/index.dart';

/// 可以通过拖动的交互方式对列表重新排序的 滚动列表 视图
/// 在 onReorder 函数中， oldIndex代表移动前item的索引，newIndex代表移动后item的索引
/// 由于在向后移动的时候，newIndex会因为之前的占位而多出一个，需要单独处理
class ReorderableListViewPage extends StatefulWidget {
  @override
  _ReorderableListViewState createState() => _ReorderableListViewState();
}

class _ReorderableListViewState extends State<ReorderableListViewPage> {
  List<String> _citys = <String>['ChengDu', 'ShangHai', 'BeiJing', 'ShenZheng', 'WuHan', 'FuJian', 'GuangZhou', 'NanJing'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReorderableListView'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ReorderableListView(
        children: _citys.map(_buildCard).toList(),
        onReorder: _onReorder,
      ),
    );
  }

  Widget _buildCard(String city) => SizedBox(
      key: ObjectKey(city),
      height: 100,
      child: Card(
        color: Colors.blueGrey.withOpacity(.5),
        child: Center(
          child: Text(
            '$city',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

  void _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex = newIndex - 1; // 处理往前移时多出一个的问题
    setState(() {
      String _city = _citys.removeAt(oldIndex);
      _citys.insert(newIndex, _city);
    });
  }
}
