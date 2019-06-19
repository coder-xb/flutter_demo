import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldPage> {
  final String _titleText = 'TextField';
  TextEditingController _usernameCor = TextEditingController();
  TextEditingController _passwordCor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            /*TextField(
            /// textCapitalization 控制输入内容英文显示形式
            ///  - TextCapitalization.words      将英文单词首字母大写
            ///  - TextCapitalization.sentences  将英文首字母大写
            ///  - TextCapitalization.characters 将所有英文字母大写
            textCapitalization: TextCapitalization.none,

            /// keyboardType 控制输入内容类型
            ///  - TextInputType.phone          手机号
            ///  - TextInputType.number         纯数字
            ///  - TextInputType.emailAddress   邮箱地址
            keyboardType: TextInputType.emailAddress,
            // 样式美化
            decoration: InputDecoration(
                // 内边距
                contentPadding: EdgeInsets.all(10),
                // 图标
                icon: Icon(Icons.person),
                // 提示文本
                labelText: '请输入用户名',
                // 帮助性的提示文本
                helperText: '请输入您注册时的用户名'),
            // 设置光标样式
            cursorColor: Colors.blueGrey,
            cursorRadius: Radius.circular(10),
            cursorWidth: 16,
            // 键盘中操作按钮样式
            textInputAction: TextInputAction.go,
          ),*/
            TextField(
              maxLength: 11,
              controller: _usernameCor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(), // input外边框
                hintText: 'Enter the username', // 输入框提示文本（placeholder）
                labelText: 'USERNAME', // 缩放到外边框的文本
                prefixIcon: Icon(Icons.person), // 边框内前置图标
                suffixIcon: Icon(Icons.close), // 边框内右边图标
              ),
            ),
            TextField(
              controller: _passwordCor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(), // input外边框
                hintText: 'Enter the password', // 输入框提示文本（placeholder）
                labelText: 'PASSWORD', // 缩放到外边框的文本
                prefixIcon: Icon(Icons.lock), // 边框内前置图标
                suffixIcon: Icon(Icons.close), // 边框内右边图标
              ),
              obscureText: true, // 是否隐藏输入的内容
            ),
            RaisedButton(
              child: Text('LOGIN'),
              onPressed: _loginCheck,
            )
          ],
        ),
      ),
    );
  }

  void _loginCheck() {
    _usernameCor.text = '';
    if (_usernameCor.text.length != 11) {
      print('The phone number is wrong.');
    }
  }
}
