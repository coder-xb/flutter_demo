import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigation_Normal'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'HOME',
          style: TextStyle(
            fontSize: 56,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
