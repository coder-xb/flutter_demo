import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheetPage> {
  final _bottomSheetKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetKey,
      appBar: AppBar(
        title: Text('BottomSheet'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Open BottomSheet'),
              onPressed: _openBottomSheet,
            ),
            RaisedButton(
              child: Text('Modal BottomSheet'),
              onPressed: _openModalBottomSheet,
            ),
          ],
        ),
      ),
    );
  }

  // 打开BottomSheet
  void _openBottomSheet() {
    _bottomSheetKey.currentState.showBottomSheet(
      (BuildContext context) => BottomAppBar(
            child: Container(
              height: 50,
              // 强制铺满屏幕
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Text(
                'This is a BottomSheet',
                textAlign: TextAlign.left,
              ),
            ),
          ),
    );
  }

  // 打开ModalBottomSheet
  void _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
              ],
            ),
          );
        }
    );
    print(option);
  }
}
