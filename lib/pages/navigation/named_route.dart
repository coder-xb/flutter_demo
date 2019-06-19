import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class NamedRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Named Route'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: RaisedButton(
          child: Text('Go'),
          // 命名路由类似web的路由，均需在MaterialApp组建中的routes进行相关的 '/xxx' 的配置，但是无法进行页面间传参
          onPressed: () => Navigator.of(context).pushNamed('/back'),
        ),
      ),
    );
  }
}
