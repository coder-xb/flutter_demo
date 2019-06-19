import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: GestureDetector( // GestureDetector是一个手势检测器
        child: Hero( // hero组件用于给用户提供一个 一个页面的某一张图片或者某一部分内容可以跨屏穿越到另一个页面的 视觉效果
          tag: 'imageHero', // 必须保证前后两个页面的tag一致
          child: Image.asset('assets/images/lake.jpg'),
        ),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => _DetailPage())),
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        centerTitle: true,
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset('assets/imgs/lake.jpg'),
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}
