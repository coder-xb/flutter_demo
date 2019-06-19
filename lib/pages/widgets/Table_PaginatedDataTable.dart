import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';
import './Table_DataModel.dart';

class PaginateDataTablePage extends StatefulWidget {
  @override
  _PaginateDataTableState createState() => _PaginateDataTableState();
}

class _PaginateDataTableState extends State<PaginateDataTablePage> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final _DateSource _data = _DateSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTable'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              rowsPerPage: 5,
              source: _data,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Title'),
                  onSort: (int index, bool ascending) {
                    _data._sortFn((item) => item.title.length, ascending);
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                    });
                  }
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _DateSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.asset(post.img)),
      ]
    );
  }

  void _sortFn(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}
