import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class RotateButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('RotateButton'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _size.width / 5,
            top: _size.height / 5,
            child: RotateButton(
              getBackCenter: true,
              dx: _size.width / 5,
              dy: _size.height / 5,
              style: Style.Touch,
              getAngle: (double angle) {
                print(angle);
              },
            ),
          )
        ],
      ),
    );
  }
}
