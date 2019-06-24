import 'package:flutter/material.dart';
import '../../../widgets/index.dart';

/// ExpansionPanelList必须放在可滑动组件中使用
/// ExpansionPanel只能在ExpansionPanelList中使用
/// 除了ExpansionPanel还有一种特殊的ExpansionPanelRadio
/// ExpansionPanelRadio也是只能在ExpansionPanelList中使用
class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListState createState() => _ExpansionPanelListState();
}

class ExpandState {
  bool open;
  int index;
  ExpandState(this.index, this.open);
}

class _ExpansionPanelListState extends State<ExpansionPanelListDemo> {
  List<int> _list = List<int>();
  // 状态保存
  List<ExpandState> _expandStates = List<ExpandState>();

  _ExpansionPanelListState() {
    _list = List<int>();
    _expandStates = List<ExpandState>.generate(10, (int index) {
      _list.add(index);
      return ExpandState(index, false);
    });
  }

  _setCurIndex(int index, bool expand) {
    setState(() {
      _expandStates.forEach((item) {
        if (item.index == index) item.open = !expand;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelList'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool expand) {
            _setCurIndex(index, expand);
          },
          children: _list
              .map((index) => ExpansionPanel(
                    headerBuilder: (BuildContext context, bool expand) =>
                        ListTile(
                          title: Text('This is item $index'),
                        ),
                    body: ListTile(
                      title: Text('This is expansion item $index'),
                    ),
                    isExpanded: _expandStates[index].open,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
