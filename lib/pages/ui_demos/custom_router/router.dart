import 'package:flutter/material.dart';

/// 自定义transitionBuilder实现页面切换动画
class CustomRouter extends PageRouteBuilder {
  final Widget widget;
  CustomRouter(this.widget)
      : super(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> anim,
                    Animation<double> chilAnim) =>
                widget,
            transitionsBuilder: (BuildContext context, Animation<double> anim,
                Animation<double> childAnim, Widget child) {
              // 淡出过渡动画
              return FadeTransition(
                opacity: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(CurvedAnimation(
                  parent: anim,
                  curve: Curves.fastOutSlowIn,
                )),
                child: child,
              );
              // 比例转换过渡动画
              /*return ScaleTransition(
                scale: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(CurvedAnimation(
                  parent: anim,
                  curve: Curves.fastOutSlowIn,
                )),
                child: child,
              );*/
              // 旋转+比列过渡动画
              /*return RotationTransition(
                turns: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(CurvedAnimation(
                  parent: anim,
                  curve: Curves.fastOutSlowIn,
                )),
                child: ScaleTransition(
                  scale: Tween(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(CurvedAnimation(
                      parent: anim, curve: Curves.fastOutSlowIn)),
                  child: child,
                ),
              );*/
              // 幻灯片过渡动画
              /*return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1.0, 0.0),
                  end: Offset(0.0, 0.0),
                ).animate(CurvedAnimation(
                  parent: anim,
                  curve: Curves.fastOutSlowIn,
                )),
                child: child,
              );*/
            });
}
