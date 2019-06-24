import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import '../../widgets/index.dart';

/// 可借助image_picker插件进行图片选择
class WrapPhoto extends StatefulWidget {
  @override
  _WrapState createState() => _WrapState();
}

class _WrapState extends State<WrapPhoto> {
  List<Widget> _list;
  // List<File> _imgs;

  @override
  void initState() {
    // _imgs = List<File>();
    _list = List<Widget>()..add(_addButton());
    super.initState();
  }

  Widget _addButton() => GestureDetector(
        onTap: () async {
          if (_list.length < 9) {
            // 异步获取本地文件
            // _imgs.add(await ImagePicker.pickImage(source: ImageSource.gallery));
            // 限制图片张数
            setState(() {
              // _list.insert(_list.length - 1, _buildPhoto(img: _imgs[_imgs.length - 1]));
              _list.insert(_list.length - 1, _buildPhoto());
            });
          }
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blueGrey,
          child: Icon(
            Icons.add,
            size: 54,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildPhoto({File img}) => Container(
        width: 100,
        height: 100,
        color: Colors.grey[100],
        child: Center(
          child: img == null
              ? Image.asset(
                  'assets/images/lake.jpg',
                  scale: .5,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  img,
                  scale: .5,
                  fit: BoxFit.cover,
                ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapPhoto'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Wrap(
          children: _list,
          spacing: 20,
          runSpacing: 20,
          crossAxisAlignment: WrapCrossAlignment.center,
        ),
      ),
    );
  }
}
