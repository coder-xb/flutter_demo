import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class WListViewPage extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<WListViewPage> {
  final String _titleText = 'ListView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        // ListView自定义列表
        child: ListView.custom(
          // 生成自定义子项
          childrenDelegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Container( // 返回自定义子项内容
              height: 50.0,
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('List $index'),
            ),
            childCount: 10,// 指定子项条数
          ),
        ),
        /*ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('1'),
          ),
          // 列表分割线
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('2'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('3'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('4'),
          )
        ],
      ),*/
        /*Container(
        child: ListView.builder(
          // 列表项个数
          itemCount: 10,
          // 排列方向 vertical垂直/horizontal水平
          scrollDirection: Axis.vertical,
          // 指定item的大小，让item加载更加高效
          // itemExtent: 50.0,
          /// physics 滑动类型设置
          /// AlwaysScrollableScrollPhysics() 总是可以滑动
          /// NeverScrollableScrollPhysics()  禁止列表滚动
          /// BouncingScrollPhysics()         内容超过一屏，滑动时有回弹效果
          /// ClampingScrollPhysics()         包裹内容，不会有回弹效果
          physics: BouncingScrollPhysics(),
          // 设置预加载的区域，若强制设置为0，从而关闭预加载
          // cacheExtent: 30.0,
          // controller: ,  滚动监听，多用于上拉加载更多，通过监听滑动距离来执行操作
          // primary: ,     默认为false，若设置为true，则controller滚动监听无法使用
          // shrinkWrap: ,  child高度会适配item填充的内容高度，通常child的高度不固定，若固定之后内容超出就会造成布局溢出
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('Title $index'), // 主标题
            subtitle: Text('Sub Title $index'), // 子标题
            leading: Icon(Icons.person), // 前置图标
            trailing: Icon(Icons.add), // 后置图标
            isThreeLine: false, // 是否显示三行
            // contentPadding: EdgeInsets.all(10.0), // 内边距
            enabled: true , // 是否不禁用
            onTap: (){}, // 点击事件
            onLongPress: (){}, // 长按事件
            selected: false,// 是否选中
          ),
        ),
      )*/
        /*Container(
        child: ListView.separated(
          // 列表项个数
          itemCount: 100,
          // 排列方向 vertical垂直/horizontal水平
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text('Title $index'), // 主标题
                subtitle: Text('Sub Title $index'), // 子标题
                leading: Icon(Icons.person), // 前置图标
                trailing: Icon(Icons.add), // 后置图标
                isThreeLine: false, // 是否显示三行
                // contentPadding: EdgeInsets.all(10.0), // 内边距
                enabled: true, // 是否不禁用
                onTap: () {}, // 点击事件
                onLongPress: () {}, // 长按事件
                selected: false, // 是否选中
              ),
          // 分割线构造器
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                color: Colors.red,
              ),
        ),
      ),*/
      ),
    );
  }
}
