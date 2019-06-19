import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageViewPage> {
  final String _titleText = 'PageView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        height: 400,
        child: PageView(
          // 翻页方向 vertical垂直/horizontal水平
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'PAGE_1',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'PAGE_2',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'PAGE_3',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'PAGE_4',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'PAGE_5',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  'PAGE_6',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
