import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Counter> {
  var _num = 0;
  void _substract() {
    setState(() {
      _num--;
    });
  }
  void _add() {
    setState(() {
      _num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
          onPressed: _substract,
          child: Text('-'),
        ),
        Text(_num.toString()),
        RaisedButton(
          onPressed: _add,
          child: Text('+'),
        )
      ],
    );
  }
}
