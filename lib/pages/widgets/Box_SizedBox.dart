import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class SizedBoxPage extends StatefulWidget {
  @override
  _SizedBoxState createState() => _SizedBoxState();
}

class _SizedBoxState extends State<SizedBoxPage> {
  final String _titleText = 'SizedBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        /// 指定宽高容器 child子组件无法设置宽高
        /// 当child为图片时  以宽高中最小的值来作为填充依据
        child: SizedBox(
          width: 600,
          height: 300,
          child: Image.asset('assets/images/lake.jpg'),
          /*child: Container(
              width: 200, // 无效设置
              height: 200, // 无效设置
              color: Colors.blueGrey,
            ),*/
        ),
      ),
    );
  }
}
