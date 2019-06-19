import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';
import './Table_DataModel.dart';

class DataTablePage extends StatefulWidget {
  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<DataTablePage> {
  final String _titleText = 'DataTable';
  int _sortColumnIndex;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: ListView(
          children: <Widget>[
            DataTable(
              // 排序依据的所在列Index
              sortColumnIndex: _sortColumnIndex,
              // 排序顺序 倒序/降序
              sortAscending: _sortAscending,
              // 列 List<DataColumn>
              columns: [
                DataColumn(
                  // 显示文本
                  label: Text('Title'),
                  // 排序处理
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                      // 排序
                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
              // 行 List<DataRow>
              rows: posts
                  .map<DataRow>((post) => DataRow(
                        // 是否选中
                        selected: post.selected,
                        // 选中项切换时
                        onSelectChanged: (bool value) {
                          setState(() {
                            if (post.selected != value) post.selected = value;
                          });
                        },
                        // 单元格 List<DataCell>
                        cells: [
                          DataCell(Text(post.title)),
                          DataCell(Text(post.author)),
                          DataCell(Image.asset(post.img)),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
