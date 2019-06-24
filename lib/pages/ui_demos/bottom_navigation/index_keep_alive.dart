import 'package:flutter/material.dart';

import './pages_keep_alive/user.dart';
import './pages_keep_alive/home.dart';
import './pages_keep_alive/message.dart';

class BottomNavigationKeep extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationKeep> {
  int _index = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          MessagePage(),
          UserPage()
        ],
        physics: AlwaysScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
            _controller.jumpToPage(index);
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('HOME'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('MESSAGE'),
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            title: Text('MEMBER'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
