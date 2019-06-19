import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ChipPage extends StatefulWidget {
  @override
  _ChipState createState() => _ChipState();
}

class _ChipState extends State<ChipPage> {
  final String _titleText = 'Chip';
  List<String> _tags = ['Android', 'IOS', 'Windows', 'MacOs', 'Linux'];
  List<String> _selects = [];
  String _choice = '';
  String _act = 'Android';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 一般用法
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  Chip(
                    // 名称
                    label: Text('Flutter'),
                  ),
                  Chip(
                    // 名称
                    label: Text(_act),
                  ),
                  Chip(
                    // 名称
                    label: Text('Flutter'),
                    // 背景色
                    backgroundColor: Colors.blueGrey,
                  ),
                  Chip(
                    // 名称
                    label: Text('Flutter'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text('1'),
                    ),
                  ),
                  Chip(
                    // 名称
                    label: Text('Flutter'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage(
                          'https://ss0.baidu.com/73x1bjeh1BF3odCf/it/u=1147681078,2292541734&fm=85&s=7C853872D73E778C5C6990DB02005035v'),
                    ),
                  ),
                  Chip(
                    // 名称
                    label: Text('Android'),
                    // 删除回调
                    onDeleted: () {},
                    // 删除图标
                    deleteIcon: Icon(Icons.cancel),
                    // 删除图标颜色
                    deleteIconColor: Colors.blueGrey,
                    // 删除提示
                    deleteButtonTooltipMessage: 'DELETE',
                  )
                ],
              ),
              // 可删除chip
              Wrap(
                spacing: 8,
                children: _tags
                    .map(
                      (tag) => Chip(
                            label: Text(tag),
                            onDeleted: () {
                              setState(() {
                                _tags.remove(tag);
                              });
                            },
                          ),
                    )
                    .toList(),
              ),
              // 可交互chip
              Wrap(
                spacing: 8,
                children: _tags
                    .map(
                      (tag) => ActionChip(
                            label: Text(tag),
                            onPressed: () {
                              setState(() {
                                _act = tag;
                              });
                            },
                          ),
                    )
                    .toList(),
              ),
              // 可过滤chip
              Text('${_selects.toString()}'),
              Wrap(
                spacing: 8,
                children: _tags
                    .map(
                      (tag) => FilterChip(
                            label: Text(tag),
                            selected: _selects.contains(tag),
                            onSelected: (val) {
                              setState(() {
                                if (_selects.contains(tag)) {
                                  _selects.remove(tag);
                                } else {
                                  _selects.add(tag);
                                }
                              });
                            },
                          ),
                    )
                    .toList(),
              ),
              Text('$_choice'),
              // 可选择chip
              Wrap(
                spacing: 8,
                children: _tags
                    .map(
                      (tag) => ChoiceChip(
                            label: Text(tag),
                            selected: _choice == tag,
                            // 选中时的背景色
                            selectedColor: Colors.blueGrey,
                            // 选中时的阴影色
                            selectedShadowColor: Colors.red,
                            // 阴影深度
                            elevation: 10,
                            // 未选中时的阴影色
                            shadowColor: Colors.blue,
                            onSelected: (val) {
                              setState(() {
                                _choice = tag;
                              });
                            },
                          ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
