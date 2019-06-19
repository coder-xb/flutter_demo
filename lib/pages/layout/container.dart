import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class ContainerPage extends StatelessWidget {
  Widget _buildImage(String name) {
    // Expanded组件可以使Row、Column、Flex等子组件在其主轴方向上展开并填充可用空间（类似于 css 的弹性盒子模型）
    return Expanded(
      child: Container( // Container组件是一个拥有绘制、定位、调整大小的 widget
        decoration: BoxDecoration( // BoxDecoration 一个背景装饰对象，相当于Android中的shape.xml，定制各种各样的背景（边框、圆角、阴影、形状、渐变、背景图像）
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        ),
        margin: const EdgeInsets.all(4.0),
        child: Image.asset('assets/images/$name.jpg', fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var container = Container(
      decoration: BoxDecoration(color: Colors.black26),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            /// Expanded组件必须用在Row、Column、Flex内，
            /// 并且从Expanded到封装它的Row、Column、Flex的路径必须只包括StatelessWidgets或StatefulWidgets组件
            children: <Widget>[
              _buildImage('small/1'),
              _buildImage('small/2')
            ],
          ),
          Row(
            children: <Widget>[
              _buildImage('small/3'),
              _buildImage('small/4')
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(child: container),
    );
  }
}
