import 'package:flutter/material.dart';
import 'dart:ui';
import '../../widgets/index.dart';

class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FrostedGlass'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: FlutterLogo(),
          ),
          Center(
            child: ClipRect(
              /// 使用BackdropFilter实现高斯模糊效果，且子组件需要设置Opacity
              /// 使用这个组件的代价很高，尽量少用
              /// ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), 决定了模糊程度，值越高越模糊
              /// 一般来说，为了防止模糊效果绘制出边界，需要使用ClipRect Widget包裹
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Opacity(
                  opacity: .5,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text(
                        'Frosted Glass[高斯模糊]',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
