import 'package:flutter/material.dart';
import '../../../widgets/index.dart';
/// 下拉加载更多[简易版]
/// 利用ScrollController监听滚动视图是否到达底部，注入新的数据
class PullUpPage extends StatefulWidget {
  @override
  _PullUpState createState() => _PullUpState();
}

class _PullUpState extends State<PullUpPage> {
  List<String> _imgs;
  ScrollController _controller;

  @override
  void initState() {
    _imgs = List<String>();
    _controller = ScrollController();
    _addTenImgs();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _addTenImgs();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PullUpLoading'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        controller: _controller,
        itemCount: _imgs.length,
        itemBuilder: (BuildContext context, int index) => Container(
              child: Image.asset(
                _imgs[index],
                fit: BoxFit.cover,
              ),
            ),
      ),
    );
  }


  void _addTenImgs() {
    /// 此处可根据实际项目进行网络请求
    for (int i = 0; i < 10; i++) {
      _imgs.add('assets/images/middle/$i.jpg');
    }
    setState(() {});
  }
}
