import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../../widgets/drawer.dart';

class RxDartSimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart [Simple]'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _RxDartDemo(),
    );
  }
}

class _RxDartDemo extends StatefulWidget {
  @override
  _RxDartState createState() => _RxDartState();
}

class _RxDartState extends State<_RxDartDemo> {
  PublishSubject<String> _textSubject;

  @override
  void initState() {
    super.initState();
    _textSubject = PublishSubject<String>();
    _textSubject.listen((date) => print(date));

     /*Observable<String> _observable =
         // Observable(Stream.fromIterable(['hello', '您好']));
         // Observable.fromFuture(Future.value('hello ~'));
         // Observable.fromIterable(['hello', '您好']);
          // Observable.just('hello ~');
         // Observable.periodic(Duration(seconds: 3), (x) => x.toString());*/

    // _observable.listen(print);

    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));

    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String val) {
        _textSubject.add('Input: $val');
      },
      onSubmitted: (String val) {
        _textSubject.add('Submit: $val');
      },
      decoration: InputDecoration(
        labelText: 'Title',
      ),
    );
  }
}
