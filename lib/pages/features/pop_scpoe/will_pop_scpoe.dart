import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/index.dart';

/// 页面退出时给出离开页面的提示
/// 使用WillPopScope组件，它会检测子组件的Navigation.pop(),并拦截
/// 在onWillPop属性中返回一个新的组件（如Dialog组件）即可

class WillPopScpoePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WillPopScpoe'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: RaisedButton(
          child: Text('TO PAGE'),
          onPressed: () {
            Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) => _BackPage()));
          },
        ),
      ),
    );
  }
}



class _BackPage extends StatefulWidget {
  @override
  _BackState createState() => _BackState();
}

class _BackState extends State<_BackPage> {
  int _counter = 0;

  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBacking,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WillPopScpoe'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'CLICK: $_counter TIMES.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              color: Colors.blueGrey,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addCounter,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Future<bool> _onBacking() => showDialog(context: context, builder: (BuildContext context) => AlertDialog(
    title: Text('Do you really want to exit this page?'),
    actions: <Widget>[
      FlatButton(
        child: Text('CANCEL'),
        onPressed: () => Navigator.of(context).pop(false),
      ),
      FlatButton(
        child: Text('CONFIRM'),
        onPressed: () => Navigator.of(context).pop(true),
      ),
    ],
  ),);
}
