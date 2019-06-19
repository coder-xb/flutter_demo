import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _RegisterForm(),
            _TextField(),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _username, _password;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
            onSaved: (String val) {
              _username = val;
            },
            autofocus: true,
            validator: _validateUsername,
            autovalidate: _autoValidate,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            onSaved: (String val) {
              _password = val;
            },
            obscureText: true,
            validator: _validatePassword,
            autovalidate: _autoValidate,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: _submitForm,
            ),
          )
        ],
      ),
    );
  }

  // 验证username
  String _validateUsername(String val) {
    if (val.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  // 验证password
  String _validatePassword(String val) {
    if (val.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  // 提交表单
  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Username: $_username');
      print('Password: $_password');

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registering...'),
      ));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}

class _TextField extends StatefulWidget {
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<_TextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      print('Input: ${_textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: (String val) {
        print('Input: $val');
      },
      onSubmitted: (String val) {
        print('Input: $val');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title.',
        // border: InputBorder.none,
        // border: OutlineInputBorder(),
        // filled: true,
      ),
    );
  }
}
