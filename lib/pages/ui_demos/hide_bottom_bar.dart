import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widgets/index.dart';

class HideBottomBarPage extends StatefulWidget {
  @override
  _HideBottomBarState createState() => _HideBottomBarState();
}

class _HideBottomBarState extends State<HideBottomBarPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  ScrollController _scrollController;

  void _judgeScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) _animationController.forward();
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) _animationController.reverse();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _scrollController = ScrollController(keepScrollOffset: true)..addListener(_judgeScroll);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _scrollController..removeListener(_judgeScroll);

    /// 如果直接销毁_scrollController，keepScrollOffset会被重置
    /// _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HideBottomBar'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _listView(),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  // 创建BottomNavigationBar
  Widget _bottomNavBar(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget child) => Container(
              height: 0,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    bottom: _animation.value,
                    left: 0.0,
                    right: 0.0,
                    child: child,
                  ),
                ],
              ),
            ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text('HOME'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text('MESSAGE'), icon: Icon(Icons.message)),
            BottomNavigationBarItem(
                title: Text('MEMBER'), icon: Icon(Icons.person)),
          ],
        ),
      );

  // 创建listview
  Widget _listView() => ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text('沉浸式底部导航栏 - index: $index'),
            ),
      );
}
