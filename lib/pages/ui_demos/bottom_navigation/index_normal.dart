import 'package:flutter/material.dart';

import './pages_normal/user.dart';
import './pages_normal/home.dart';
import './pages_normal/message.dart';

class BottomNavigationNormal extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationNormal> {
  int _index = 0;
  List<Widget> _pages = List<Widget>();

  @override
  void initState() {
    _pages..add(HomePage())..add(MessagePage())..add(UserPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
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
