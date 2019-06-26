
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../../widgets/index.dart';

class HeroDemoPage extends StatefulWidget {
  @override
  _HeroState createState() => _HeroState();
}

class _HeroState extends State<HeroDemoPage> {
  List<String> _list = List<String>();

  @override
  void initState() {
    _list = List<String>.generate(20, (int index) => 'This is No.$index');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(_list[index]),
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'floatingActionButton',
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => _InputPage(),
        )),
      ),
    );
  }
}

class _InputPage extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<_InputPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Something'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: _focusNode,
                maxLines: 5,
                decoration: InputDecoration.collapsed(
                  hintText: 'Do you want to add something?',
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Hero(
        tag: 'FloatingActionButton',
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6),
          child: ButtonTheme(
            height: 48,
            minWidth: double.infinity,
            child: RaisedButton(
              color: Colors.blueGrey,
              onPressed: () {},
              elevation: 10,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
