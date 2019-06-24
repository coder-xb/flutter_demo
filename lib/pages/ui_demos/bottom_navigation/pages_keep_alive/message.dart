import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessagePage> with AutomaticKeepAliveClientMixin {
  int _count = 0;
  @override
  bool get wantKeepAlive => true;
  void _addCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigation_KeepAlive'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'MESSAGE',
              style: TextStyle(
                fontSize: 56,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              'CLICK: $_count TIMES.',
              style: TextStyle(
                fontSize: 46,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
        onPressed: _addCount,
      ),
    );
  }
}
