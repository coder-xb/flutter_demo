import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../widgets/index.dart';

// 此示例来自官网
class AnimateListPage extends StatefulWidget {
  @override
  _AnimateListState createState() => _AnimateListState();
}

class _AnimateListState extends State<AnimateListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  // 构建尚未删除的列表项
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
        animation: animation,
        item: _list[index],
        selected: _selectedItem == _list[index],
        onTap: () {
          setState(() {
            _selectedItem = _selectedItem == _list[index] ? null : _list[index];
          });
        });
  }

  /// 从列表中删除项目后构建列表项。
  /// 因为已删除的列表项在其动画完成之前仍然可见（即使它与ListMode有关，但它已经消失了）
  /// 组件将使用[AnimatedListState.removeItem]方法来使用[AnimatedListRemovedItemBuilder]的参数
  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(animation: animation, item: item, selected: false);
    // 这里没有手势检测器：我们不希望删除的项目是交互式的。
  }

  // 插入下一个列表项
  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  // 从列表模型中删除所选项目
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: _insert,
            tooltip: 'Insert a new item',
          ),
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: _remove,
            tooltip: 'Remove the selected item',
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }
}
// listModel
class ListModel<E> {
  ListModel(
      {@required this.listKey,
      @required this.removedItemBuilder,
      Iterable<E> initialItems})
      : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);

    if (removedItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;
  E operator [](int index) => _items[index];
  int indexOf(E item) => _items.indexOf(item);
}
/// 在卡片颜色所基于的卡片上将其整数项目显示为“项目N”
/// 项目的价值。 如果选择为真，则文本以亮绿色显示。
/// 这个小部件的高度基于动画参数，它有所不同
/// 从0到128，因为动画从0.0到1.0不等。
class CardItem extends StatelessWidget {
  const CardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Card(
            color: Colors.primaries[item & Colors.primaries.length],
            child: Center(
              child: Text('Item $item', style: textStyle),
            ),
          ),
        ),
      ),
    );
  }
}
