import 'package:flutter/material.dart';
import '../../../widgets/index.dart';

/// 下拉刷新[简易版]
/// 在ListView外套一层RefreshIndicator，
/// 并在onRefresh方法中重新注入数据
class PullDownPage extends StatefulWidget {
  @override
  _PullDownState createState() => _PullDownState();
}

class _PullDownState extends State<PullDownPage> {
  List<String> _imgs;

  @override
  void initState() {
    _imgs = List<String>();
    _resetImgs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PullDownRefresh'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: _resetImgs,
        child: ListView.builder(
          itemCount: _imgs.length,
          itemBuilder: (BuildContext context, int index) => Container(
                child: Image.asset(
                  _imgs[index],
                  fit: BoxFit.cover,
                ),
              ),
        ),
      ),
    );
  }

  Future<void> _resetImgs() async {
    await Future.delayed(const Duration(seconds: 1));
    _imgs.clear();
    /// 此处可根据实际项目进行网络请求
    for (int i = 0; i < 10; i++) {
      _imgs.add('assets/images/middle/$i.jpg');
    }
    setState(() {});
  }
}
