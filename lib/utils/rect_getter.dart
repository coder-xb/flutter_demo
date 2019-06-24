import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/// 需要实时获得某个Widget的Rect信息时使用该组件
/// 可选传GlobalKey和无参两种构造方式，之后利用对象本身或者构造传入的key以获取信息
/// Use this widget to get a widget`s rectangle information in real-time .
/// It has 2 constructors , pass a globalkey or use default key , and then you can use the key or object itself to get info .
class RectGetter extends StatefulWidget {
  final GlobalKey<_RectState> key;
  final Widget child;

  /// 当获取到某RectGetter对象的key值时可以调用该方法获取其child的rect信息
  /// When the key value of a RectGetter object is obtained, the method can be called to obtain the rect information of the child.
  static Rect getRectFormKey(GlobalKey<_RectState> key) {
    var obj = key?.currentContext?.findRenderObject(),
        translation = obj?.getTransformTo(null)?.getTranslation(),
        size = obj?.semanticBounds?.size;
    return translation != null && size != null
        ? Rect.fromLTRB(translation.x, translation.y, size.width, size.height)
        : null;
  }
  /// 创建一个自定义的globalkey，用这种方式可以避免 dart2 中的type exception
  /// Create a custom globalkey , use this way to avoid type exception in dart2 .
  static GlobalKey<_RectState> createGlobalKey() => GlobalKey<_RectState>();

  /// 用已知的GlobalKey来构造，便于使用RectGetter.getRectFormKey(key)方式直接获取Rect信息
  /// Constructed with a known GlobalKey to easily get Rect information directly using RectGetter.getRectFormKey(key).
  RectGetter({@required this.key, @required this.child}) : super(key: key);

  /// 默认GlobalKey的命名无参构造，调用RectGetter.getRect方式获取Rect
  /// Use defaultKey to build RectGetter , and then use RectGetter.getRect() method to get child`s rect
  factory RectGetter.defaultKey({@required Widget child}) => RectGetter(
    key: GlobalKey<_RectState>(),
    child: child,
  );

  Rect getRect() => getRectFormKey(this.key);

  /// 克隆新对象实例，避免统一GlobalKey在组件树上重复出现
  /// Clone new object instances to avoid recurring GlobalKey on the component tree.
  RectGetter clone() => RectGetter.defaultKey(child: this.child);

  @override
  _RectState createState() => _RectState();
}

class _RectState extends State<RectGetter> {
  @override
  Widget build(BuildContext context) => widget.child;
}
