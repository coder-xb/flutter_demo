import 'dart:async';

class CounterBloc {
  int _count = 0;
  final _counterController = StreamController<int>.broadcast();

  Stream<int> get stream => _counterController.stream;
  int get value => _count;

  void increment() {
    _counterController.sink.add(++_count);
  }

  void dispose() {
    _counterController.close();
  }
}
