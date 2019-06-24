import 'package:flutter/material.dart';
import './blocs/provider.dart';

class ActionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartBLoC'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.stream,
          initialData: _bloc.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) => Text(
                'CLICK: ${snapshot.data} TIMES.',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.blueGrey,
                ),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
        onPressed: () => _bloc.increment(),
      ),
    );
  }
}
