import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../../widgets/index.dart';

/// 表单页面退出时给出离开页面的提示
/// 使用form自带的onWillPop属性，其余与will_pop_scope中一致

class FormPopScpoePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormPopScpoe'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: RaisedButton(
          child: Text('TO FORM PAGE'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => _BackPage()));
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
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBacking,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WillPopScpoe'),
          centerTitle: true,
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            onWillPop: _onBacking,
            key: _key,
            autovalidate: true,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your real name',
                    labelText: 'RealName',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Birth',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Enter your phone number',
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter a email address',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                InputDecorator(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.color_lens),
                    labelText: 'Color',
                  ),
                  isEmpty: _color == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _color,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          _color = newValue;
                        });
                      },
                      items: _colors
                          .map(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                  child: new RaisedButton(
                    child: const Text('Submit'),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBacking() => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
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
            ),
      );
}
