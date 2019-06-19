import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class GridTilePage extends StatefulWidget {
  @override
  _GridTileState createState() => _GridTileState();
}

class _GridTileState extends State<GridTilePage> {
  final String _titleText = 'GridTile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          height: 500,
          color: Colors.black26,
          child: GridView.count(
            // 水平交叉轴的列数
            crossAxisCount: 2,
            // 垂直主轴的间距
            mainAxisSpacing: 10,
            // 水平交叉轴的间距
            crossAxisSpacing: 4,
            // 内边距
            padding: EdgeInsets.all(4),
            children: <Widget>[
              GridTile(
                header: Text('Header'),
                child: Image.asset('assets/images/lake.jpg'),
                footer: Text('Footer'),
              ),
              Image.asset('assets/images/lake.jpg'),
              Image.asset('assets/images/lake.jpg'),
              GridTile(
                header: GridTileBar(
                  title: Text('Header'),
                  subtitle: Text('SubHeader'),
                  leading: Icon(Icons.apps),
                ),
                child: Image.asset(
                  'assets/images/lake.jpg',
                  fit: BoxFit.cover,
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black26,
                  title: Text('Footer'),
                  subtitle: Text('SubFooter'),
                  leading: Icon(Icons.apps),
                ),
              ),
              GridPaper(
                color: Colors.blueGrey,
                child: Image.asset('assets/images/lake.jpg'),
              ),
              Image.asset('assets/images/lake.jpg'),
              Image.asset('assets/images/lake.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
