import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../widgets/drawer.dart';

class CheckedPopupMenuItemPage extends StatefulWidget {
  @override
  _CheckedPopupMenuItemState createState() => _CheckedPopupMenuItemState();
}

class _CheckedPopupMenuItemState extends State<CheckedPopupMenuItemPage> {
  final String _titleText = 'CheckedPopupMenuItem';
  final String _val1 = '1';
  final String _val2 = '2';
  final String _val3 = '3';
  final String _val4 = '4';
  final String _val5 = '5';
  final String _val6 = '6';
  List<String> _vals = ['1'];

  @override
  void initState() {
    super.initState();
    _vals = <String>[_val1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: ListTile(
          title: Text(
            _titleText,
            style: TextStyle(color: Colors.blueGrey),
          ),
          trailing: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            onSelected: _showMenu,
            icon: Icon(
              Icons.menu,
              color: Colors.blueGrey,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              // 有选择标记的弹出菜单项
              CheckedPopupMenuItem<String>(
                value: _val1,
                checked: _isChecked(_val1),
                child: Text(_val1),
              ),
              CheckedPopupMenuItem<String>(
                value: _val2,
                checked: _isChecked(_val2),
                child: Text(_val2),
              ),
              CheckedPopupMenuItem<String>(
                value: _val3,
                checked: _isChecked(_val3),
                child: Text(_val3),
              ),
              CheckedPopupMenuItem<String>(
                value: _val4,
                enabled: false, // 是否可点击
                checked: _isChecked(_val4),
                child: Text(_val4),
              ),
              CheckedPopupMenuItem<String>(
                value: _val5,
                checked: _isChecked(_val5),
                child: Text(_val5),
              ),
              CheckedPopupMenuItem<String>(
                value: _val6,
                checked: _isChecked(_val6),
                child: Text(_val6),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showMenu(String val) {
    if (_vals.contains(val)) {
      _vals.remove(val);
    } else {
      _vals.add(val);
    }
    _showInSnackBar('Checked $_vals');
  }

  bool _isChecked(String val) => _vals.contains(val);

  void _showInSnackBar(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black26,
        textColor: Colors.white
    );
  }
}
