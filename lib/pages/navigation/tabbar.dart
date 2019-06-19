import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TabBar Navigation'),
          centerTitle: true,
        ),
        drawer: AppDrawer(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 3),
              RaisedButton(
                child: Text('Enter TabBar'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => _TabBar(),
                    )),
              ),
              Spacer(),
              Text(
                  'Use BottomNavigationBar to display tabs, and Stack to keep each tab\'s state when switching between tabs.'),
              Spacer(flex: 3)
            ],
          ),
        ));
  }
}

class _TabBar extends StatefulWidget {
  static final golbalKey = GlobalKey<_TabBarPageState>();
  _TabBar() : super(key: golbalKey);
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<_TabBar> {
  final _navKeys = _TabBars.tabs
      .map<GlobalKey<NavigatorState>>((val) => GlobalKey<NavigatorState>())
      .toList();
  final _focusNodes =
      _TabBars.tabs.map<FocusScopeNode>((val) => FocusScopeNode()).toList();
  var _index = 0;

  void swtichTab(int index) {
    setState(() {
      _index = index;
    });
    // FixBug: Offstage组件不会自动失去焦点.
    FocusScope.of(context).setFirstFocus(_focusNodes[index]);
  }

  // 在Android物理返回按键按下时，如果嵌套导航器可以返回，确保不返回根导航器的路径
  Future<bool> _onWillPop() async {
    final maybePop = await _navKeys[_index].currentState.maybePop();
    return Future.value(!maybePop);
  }

  @override
  Widget build(BuildContext context) {
    // 和嵌套导航类似，使用WillPopScope来响应Android的物理返回按键
    return WillPopScope(
      onWillPop: _onWillPop,
      child: IndexedStack(
        index: _index,
        children: _TabBars.tabs
            .asMap()
            .entries
            .map<Widget>(
              (entry) => FocusScope(
                    node: _focusNodes[entry.key],
                    child: Navigator(
                      key: _navKeys[entry.key],
                      onGenerateRoute: (set) {
                        WidgetBuilder builder;
                        switch (set.name) {
                          case '/':
                            builder = entry.value['builder'];
                            break;
                          default:
                            throw Exception('Invalid route: ${set.name}');
                        }
                        return MaterialPageRoute(
                          builder: builder,
                          settings: set,
                        );
                      },
                    ),
                  ),
            )
            .toList(),
      ),
    );
  }
}

class _TabBars extends StatelessWidget {
  static final tabs = [
    {
      'title': Text('First'),
      'icon': Icon(Icons.home),
      'builder': (BuildContext context) => _FirstTabPage()
    },
    {
      'title': Text('Second'),
      'icon': Icon(Icons.add),
      'builder': (BuildContext context) => _SecondTabPage()
    },
    {
      'title': Text('Third'),
      'icon': Icon(Icons.account_circle),
      'builder': (BuildContext context) => _ThirdTabPage()
    }
  ];
  final int currentIndex;
  _TabBars({Key key, this.currentIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 底部导航组件
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index != currentIndex)
          _TabBar.golbalKey.currentState.swtichTab(index);
      },
      items: tabs
          .map<BottomNavigationBarItem>(
            (v) => BottomNavigationBarItem(icon: v['icon'], title: v['title']),
          )
          .toList(),
    );
  }
}

class _FirstTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Tab'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 3),
          RaisedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => _BackPage(),
            )),
            child: Text('Go'),
          ),
          Spacer(),
          Counter(),
          Spacer(flex: 3),
        ],
      ),
      bottomNavigationBar: _TabBars(currentIndex: 0),
    );
  }
}

class _SecondTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Tab'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 3),
          RaisedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => _BackPage(),
            )),
            child: Text('Go'),
          ),
          Spacer(),
          Counter(),
          Spacer(flex: 3),
        ],
      ),
      bottomNavigationBar: _TabBars(currentIndex: 1),
    );
  }
}

class _ThirdTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Tab'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 3),
          RaisedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => _BackPage(),
                )),
            child: Text('Go'),
          ),
          Spacer(),
          Counter(),
          Spacer(flex: 3),
        ],
      ),
      bottomNavigationBar: _TabBars(currentIndex: 2),
    );
  }
}

class _BackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Back'),
        ),
      ),
    );
  }
}
