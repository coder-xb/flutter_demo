import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class GridViewCountPage extends StatelessWidget {
  Widget buildGrid(BuildContext context) {
    final orietation = MediaQuery.of(context).orientation;
    // 固定GridView 中一行显示的 个数
    return GridView.count(
      crossAxisCount: (orietation == Orientation.portrait) ? 2 : 3,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: (orietation == Orientation.portrait) ? 1 : 1.2,
      children: List<Widget>.generate(
        30,
        (index) => GridTile( // 一个在图片上带有一些文字浮层的组件
              child: Image.asset(
                'assets/images/middle/${index + 1}.jpg',
                fit: BoxFit.cover,
              ),
              footer: GridTileBar( // 在图片下方有一个区域显示一些文字
                backgroundColor: Colors.black45,
                title: Text('Image ${index + 1}'),
                subtitle: Text('Description of ${index + 1}'),
                trailing: Icon(Icons.star_border, color: Colors.white),
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CridView Count'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: buildGrid(context),
      ),
    );
  }
}
