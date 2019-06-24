import 'package:flutter/material.dart';
import './bloc.dart';

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc = CounterBloc();

  CounterProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CounterBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider)
          .bloc;
}
