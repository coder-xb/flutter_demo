import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class BackToTop extends StatefulWidget {
  @override
  _BackToTopState createState() => _BackToTopState();
}

class _BackToTopState extends State<BackToTop>
    with SingleTickerProviderStateMixin {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
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
        title: Text('BackToTop'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        controller: _controller,
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) => ListTile(
              title: Center(
                child: Text(
                  'This is No.$index item.',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _backToTop,
        child: Icon(Icons.vertical_align_top),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  // 回到顶部
  void _backToTop() {
    if (_controller.offset != 0) {
      _controller.animateTo(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }
}
