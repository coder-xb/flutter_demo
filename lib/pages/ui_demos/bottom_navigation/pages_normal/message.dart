import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

class MessagePage extends StatelessWidget {
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
          'MESSAGE',
          style: TextStyle(
            fontSize: 56,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
