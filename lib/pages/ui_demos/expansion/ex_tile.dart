import 'package:flutter/material.dart';
import '../../../widgets/index.dart';

/// 基础展开的组件ExpansionTile
/// 将需要被展开的组件部分放在children即可
/// 其他用法和 ListTile 相同，但是不能设置 subtitle 属性
/// 当ExpansionTile被展开时，可以对其设置backgroundColor
/// 此时还会有一个transition动画过渡
/// 当ListView中有多个ExpansionTile时，
/// 需要给ExpansionTile指定唯一的[PageStorageKey]
/// 用以保证在列表进行滚动时能保持ExpansionTile的展开状态
class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: ExpansionTile(
          // 主标题
          title: Text('ExpansionTile Title'),
          // 前置图标
          leading: Icon(Icons.menu),
          // 展开时的背景色
          backgroundColor: Colors.white,
          // 初始是否展开
          // initiallyExpanded: true,
          // 展开的子组件 List<Widget>
          children: <Widget>[
            ListTile(
              title: Text('Tile Title'),
              subtitle: Text('Tile SubTitle'),
            ),
          ],
        ),
      ),
    );
  }
}
