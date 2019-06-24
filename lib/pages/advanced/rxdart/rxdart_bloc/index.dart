import 'package:flutter/material.dart';
import '../../../../widgets/drawer.dart';
import './blocs/provider.dart';
import './action.dart';

class RxDartBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: MaterialApp(
        home: _BlocWidget(),
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
      ),
    );
  }
}

class _BlocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartBLoC'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.stream,
          initialData: _bloc.value,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) => Text(
                'CLICK: ${snapshot.data} TIMES.',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.blueGrey,
                ),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.blueGrey,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActionPage())),
      ),
    );
  }
}
