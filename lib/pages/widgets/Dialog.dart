import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogPage> {
  final String _titleText = 'Dialog';
  // 打开AboutDialog
  void showAboutDialog(BuildContext context) {
    // 调用方法
    showDialog(
      context: context,
      // 构造器
      builder: (_) => AboutDialog(
        applicationName: 'Flutter APP',
        applicationIcon: Icon(Icons.apps),
        applicationVersion: 'V3.1.2',
        children: <Widget>[Text('This is AboutDialog')],
      ),
    );
  }

  // 打开SimpleDialog
  void showSimpleDialog(BuildContext context) {
    // 调用方法
    showDialog<Null>(
      context: context,
      // 构造器
      builder: (BuildContext context) => SimpleDialog(
        title: Text('SELECT'),
        children: <Widget>[
          // 选项
          SimpleDialogOption(
            child: Text('OPTION_1'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text('OPTION_2'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  // 打开AlertDialog
  void showAlertDialog(BuildContext context) {
    // 调用方法
    showDialog<void>(
      context: context,
      // 构造器
      builder: (BuildContext context) => AlertDialog(
        title: Text('TITLE'),
        // 内容
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
              Text('List...'),
            ],
          ),
        ),
        // 操作按钮
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
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
        child: RaisedButton(
          child: Text('CLICK ME'),
          onPressed: () {
            // showAboutDialog(context);
            // showSimpleDialog(context);
            showAlertDialog(context);
          },
        ),
        /*child: Dialog(
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('This is a Dialog'),
              RaisedButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),*/
      ),
    );
  }
}
