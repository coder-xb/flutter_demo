import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/drawer.dart';

class FileImagePage extends StatefulWidget {
  @override
  _FileImageState createState() => _FileImageState();
}

class _FileImageState extends State<FileImagePage> {
  final String _titleText = 'FileImage';
  File _img;
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
            Center(
              child: _img == null
                  ? Text('NO IMAGE')
                  : Image.file(
                _img,
                scale: .5,
                fit: BoxFit.cover,
              ),
            ),
            // 选择图片按钮
            FlatButton(
              onPressed: _getFileImage,
              child: Text(
                'SELECT IMAGE',
                style: TextStyle(color: Colors.blueGrey),
              ),
            )
          ],
        ),
      ),
    );
  }
  // 异步获取本地文件
  Future _getFileImage() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _img = img;
    });
  }
}
