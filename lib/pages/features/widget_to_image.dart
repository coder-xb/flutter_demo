import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as UI;
import 'dart:typed_data';
import '../../widgets/index.dart';

/// APP内截屏
/// 首先我们需要一个RepaintBoundary Widget，并将它包裹在我们需要 toImage的Widget 当中，并给它一个 GlobalKey
/// 然后在 _capturePng() 方法中，让RepaintBoundary对象通过GlobalKey获取RepaintBoundary Widget的子树的RenderObject
/// 这样我们可以使用RenderRepaintBoundary的toImage 方法将其转化为 Image
/// 要使用toImage，渲染对象必须经理绘制阶段（即debugNeedsPaint必须为false）
/// 所以当我们当前页面还未加载完毕的时候，是无法进行截图的
/// 获取原始图像数据后，我们将其转换为ByteData,然后再将ByteData转化为Uint8List
/// 之后我们只需要使用Image.memory(Uint8List)就能显示获得的图像了
/// 由于我们拿到的是当前页面widget产生的renderObject，所以生成的图片也只有当前页面
class WidgetToImage extends StatefulWidget {
  @override
  _WidgetToImageState createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final GlobalKey _key = GlobalKey();
  List<String> _imgs;

  @override
  void initState() {
    _imgs = List<String>.generate(
        10, (int index) => 'assets/images/middle/${index+1}.jpg');
    super.initState();
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary _boundary = _key.currentContext.findRenderObject();
      UI.Image _img = await _boundary.toImage(pixelRatio: 3.0);
      ByteData _byteDate = await _img.toByteData(format: UI.ImageByteFormat.png);
      Uint8List _pngBytes = _byteDate.buffer.asUint8List();
      String _base64 = base64Encode(_pngBytes);
      print(_base64);
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex) => Scaffold(
          appBar: AppBar(
            title: Text('Show Image'),
            centerTitle: true,
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                Image.memory(_pngBytes, fit: BoxFit.fitWidth,)
              ],
            ),
          ),
        ),),);
      });
      return _pngBytes;
    } catch (e) {
      print('Widget To Image Error:::$e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Widget To Image'),
          centerTitle: true,
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: _imgs.length,
          itemBuilder: (BuildContext context, int index) => Container(
            child: Image.asset(
              _imgs[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _capturePng,
          child: Icon(Icons.fullscreen),
        ),
      ),
    );
  }
}
