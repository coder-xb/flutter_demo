import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class TablePage extends StatefulWidget {
  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<TablePage> {
  final String _titleText = 'Table';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        // 表格组件
        child: Table(
          // 所有列的列宽
          columnWidths: <int, FixedColumnWidth>{
            // 单独某一列的列宽
            0: FixedColumnWidth(100),
            1: FixedColumnWidth(200),
            2: FixedColumnWidth(50),
          },
          // 表格边框样式
          border: TableBorder.all(
            color: Colors.blueGrey,
            width: 2,
            style: BorderStyle.solid,
          ),
          // 行
          children: <TableRow>[
            // 第一行
            TableRow(
              // 行的样式
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              // 可以使用SizedBox或Container来增加行高等样式属性
              children: <Widget>[Text('NAME'), Text('SEX'), Text('AGE')],
            ),
            // 第二行
            TableRow(
              children: [Text('Name'), Text('Sex'), Text('Age')],
            ),
            // 第三行
            TableRow(
              children: [Text('Name'), Text('Sex'), Text('Age')],
            ),
            // 第四行
            TableRow(
              children: [Text('Name'), Text('Sex'), Text('Age')],
            ),
          ],
        ),
      ),
    );
  }
}
