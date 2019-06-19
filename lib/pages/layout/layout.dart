import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _AspectRatio(),
            _Stack(),
            _IconBadge(Icons.save)
          ],
        ),
      ),
    );
  }
}

class _AspectRatio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.blueGrey,
      ),
    );
  }
}

class _Stack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          width: 200,
          height: 300,
          child: Container(
            alignment: Alignment(0, -0.9),
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1),
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                Color.fromRGBO(7, 102, 255, 1),
                Color.fromRGBO(3, 54, 255, 1),
              ]),
            ),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32),
          ),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16),
        ),
        Positioned(
          right: 40,
          top: 60,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18),
        ),
        Positioned(
          right: 20,
          top: 120,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 20),
        ),
        Positioned(
          right: 70,
          top: 180,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16),
        ),
        Positioned(
          right: 30,
          top: 230,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18),
        ),
        Positioned(
          right: 90,
          bottom: 20,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16),
        ),
        Positioned(
          right: 4,
          bottom: -4,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16),
        ),
      ],
    );
  }
}

// 图标徽章
class _IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  _IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 20,
      color: Colors.blueGrey,
    );
  }
}
