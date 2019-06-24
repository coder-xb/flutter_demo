import 'package:flutter/material.dart';
import './router.dart';
import '../../../widgets/index.dart';

class CustomRouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomRouter'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'FIRST PAGE',
              style: TextStyle(
                fontSize: 42,
                color: Colors.white,
              ),
            ),
            MaterialButton(
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 64,
              ),
              onPressed: () =>
                  Navigator.of(context).push(CustomRouter(_NextPage())),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomRouter'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'SECOND PAGE',
              style: TextStyle(
                fontSize: 42,
                color: Colors.white,
              ),
            ),
            MaterialButton(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 64,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
