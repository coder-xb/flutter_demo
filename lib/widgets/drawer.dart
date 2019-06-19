import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import '../pages/index.dart';

class AppDrawer extends StatefulWidget {
  @override
  DrawerState createState() => DrawerState();
}

class DrawerState extends State<AppDrawer> {
  static var _packageInfo = PackageInfo();
  static var _isHome = true;
  static final _panels = [
    {
      'title': 'Widgets', 'expanded': false,
      'items': [
        {'title': 'Align', 'selected': false, 'builder': (BuildContext context) => AlignPage()},
        {'title': 'Bar_AppBar', 'selected': false, 'builder': (BuildContext context) => BarAppBar()},
        {'title': 'Bar_BottomAppBar', 'selected': false, 'builder': (BuildContext context) => BarBottomAppBar()},
        {'title': 'Bar_BottomNavigationBar', 'selected': false, 'builder': (BuildContext context) => BottomNavigationBarPage()},
        {'title': 'Bar_ButtonBar', 'selected': false, 'builder': (BuildContext context) => BarButtonBar()},
        {'title': 'Bar_FlexibleSpaceBar', 'selected': false, 'builder': (BuildContext context) => FlexibleSpaceBarPage()},
        {'title': 'Bar_SliverAppBar', 'selected': false, 'builder': (BuildContext context) => SliverAppBarPage()},
        {'title': 'Bar_SnackBar', 'selected': false, 'builder': (BuildContext context) => SnackBarPage()},
        {'title': 'Bar_TabBar', 'selected': false, 'builder': (BuildContext context) => BarTabBarPage()},
        {'title': 'Box_ConstrainedBox', 'selected': false, 'builder': (BuildContext context) => ConstrainedBoxPage()},
        {'title': 'Box_DecoratedBox', 'selected': false, 'builder': (BuildContext context) => DecoratedBoxPage()},
        {'title': 'Box_FittedBox', 'selected': false, 'builder': (BuildContext context) => FittedBoxPage()},
        {'title': 'Box_OverflowBox', 'selected': false, 'builder': (BuildContext context) => OverflowBoxPage()},
        {'title': 'Box_RotatedBox', 'selected': false, 'builder': (BuildContext context) => RotatedBoxPage()},
        {'title': 'Box_SizedBox', 'selected': false, 'builder': (BuildContext context) => SizedBoxPage()},
        {'title': 'Button_DropdownButton', 'selected': false, 'builder': (BuildContext context) => DropdownButtonPage()},
        {'title': 'Button_FlatButton', 'selected': false, 'builder': (BuildContext context) => FlatButtonPage()},
        {'title': 'Button_FloatingActionButton', 'selected': false, 'builder': (BuildContext context) => FloatingActionButtonPage()},
        {'title': 'Button_IconButton', 'selected': false, 'builder': (BuildContext context) => IconButtonPage()},
        {'title': 'Button_OutlineButton', 'selected': false, 'builder': (BuildContext context) => OutlineButtonPage()},
        {'title': 'Button_RaisedButton', 'selected': false, 'builder': (BuildContext context) => RaisedButtonPage()},
        {'title': 'Button_RawMaterialButton', 'selected': false, 'builder': (BuildContext context) => RawMaterialButtonPage()},
        {'title': 'Card', 'selected': false, 'builder': (BuildContext context) => CardsPage()},
        {'title': 'Checkbox_Checkbox', 'selected': false, 'builder': (BuildContext context) => CheckBoxPage()},
        {'title': 'Checkbox_CheckboxListTile', 'selected': false, 'builder': (BuildContext context) => CheckBoxListTilePage()},
        {'title': 'Chip', 'selected': false, 'builder': (BuildContext context) => ChipPage()},
        {'title': 'Dialog', 'selected': false, 'builder': (BuildContext context) => DialogPage()},
        {'title': 'Dismissible', 'selected': false, 'builder': (BuildContext context) => DismissiblePage()},
        {'title': 'Expanded', 'selected': false, 'builder': (BuildContext context) => ExpandedPage()},
        {'title': 'Grid_GridTile', 'selected': false, 'builder': (BuildContext context) => GridTilePage()},
        {'title': 'Grid_GridView', 'selected': false, 'builder': (BuildContext context) => GridViewPage()},
        {'title': 'Icon_Icon', 'selected': false, 'builder': (BuildContext context) => IconPage()},
        {'title': 'Icon_IconData', 'selected': false, 'builder': (BuildContext context) => IconDataPage()},
        {'title': 'Icon_IconTheme', 'selected': false, 'builder': (BuildContext context) => IconThemePage()},
        {'title': 'Image_AssetImage', 'selected': false, 'builder': (BuildContext context) => AssetImagePage()},
        {'title': 'Image_DecorationImage', 'selected': false, 'builder': (BuildContext context) => DecorationImagePage()},
        {'title': 'Image_FileImage', 'selected': false, 'builder': (BuildContext context) => FileImagePage()},
        {'title': 'Image_Image', 'selected': false, 'builder': (BuildContext context) => ImagePage()},
        {'title': 'Input_TextField', 'selected': false, 'builder': (BuildContext context) => TextPage()},
        {'title': 'Layout_Center', 'selected': false, 'builder': (BuildContext context) => CenterPage()},
        {'title': 'Layout_Column', 'selected': false, 'builder': (BuildContext context) => ColumnPage()},
        {'title': 'Layout_Container', 'selected': false, 'builder': (BuildContext context) => WContainerPage()},
        {'title': 'Layout_Row', 'selected': false, 'builder': (BuildContext context) => RowPage()},
        {'title': 'List_ListBody', 'selected': false, 'builder': (BuildContext context) => ListBodyPage()},
        {'title': 'List_ListView', 'selected': false, 'builder': (BuildContext context) => WListViewPage()},
        {'title': 'Menu_CheckedPopupMenuItem', 'selected': false, 'builder': (BuildContext context) => CheckedPopupMenuItemPage()},
        {'title': 'Menu_DropdownMenuItem', 'selected': false, 'builder': (BuildContext context) => DropdownMenuItemPage()},
        {'title': 'Menu_PopupMenuButton', 'selected': false, 'builder': (BuildContext context) => PopupMenuButtonPage()},
        {'title': 'Picker_DatePicker', 'selected': false, 'builder': (BuildContext context) => DatePickerPage()},
        {'title': 'Progress_ProgreeIndicator', 'selected': false, 'builder': (BuildContext context) => ProgressIndicatorPage()},
        {'title': 'Radio_Radio', 'selected': false, 'builder': (BuildContext context) => RadioPage()},
        {'title': 'Radio_RadioListTile', 'selected': false, 'builder': (BuildContext context) => RadioListTilePage()},
        {'title': 'Scabffold_Material', 'selected': false, 'builder': (BuildContext context) => ScaffoldPage()},
        {'title': 'Scroll_PageView', 'selected': false, 'builder': (BuildContext context) => PageViewPage()},
        {'title': 'Slider_Slider', 'selected': false, 'builder': (BuildContext context) => SliderPage()},
        {'title': 'Slider_SliderTheme', 'selected': false, 'builder': (BuildContext context) => SliderThemePage()},
        {'title': 'Spacing_AnimatedPadding', 'selected': false, 'builder': (BuildContext context) => AnimatedPaddingPage()},
        {'title': 'Spacing_Padding', 'selected': false, 'builder': (BuildContext context) => PaddingPage()},
        {'title': 'Stack_IndexedStack', 'selected': false, 'builder': (BuildContext context) => IndexedStackPage()},
        {'title': 'Stack_Stack', 'selected': false, 'builder': (BuildContext context) => StackPage()},
        {'title': 'Switch_AnimatedSwitcher', 'selected': false, 'builder': (BuildContext context) => AnimatedSwitcherPage()},
        {'title': 'Switch_Switch', 'selected': false, 'builder': (BuildContext context) => SwitchPage()},
        {'title': 'Switch_SwitchListTile', 'selected': false, 'builder': (BuildContext context) => SwitchListTilePage()},
        {'title': 'Table', 'selected': false, 'builder': (BuildContext context) => TablePage()},
        {'title': 'Text_RichText', 'selected': false, 'builder': (BuildContext context) => RichTextPage()},
        {'title': 'Text_Text', 'selected': false, 'builder': (BuildContext context) => TextPage()},
      ]
    },
    {
      'title': 'Layout', 'expanded': false,
      'items': [
        {'title': 'Horizontal&Vertical Align', 'selected': false, 'builder': (BuildContext context) => HoriVertAlignPage()},
        {'title': 'Horizontal&Vertical Sizing', 'selected': false, 'builder': (BuildContext context) => HoriVertSizingPage()},
        {'title': 'Container', 'selected': false, 'builder': (BuildContext context) => ContainerPage()},
        {'title': 'GridView Extent', 'selected': false, 'builder': (BuildContext context) => GridViewExtentPage()},
        {'title': 'GridView Count', 'selected': false, 'builder': (BuildContext context) => GridViewCountPage()},
        {'title': 'ListView', 'selected': false, 'builder': (BuildContext context) => ListViewPage()},
        {'title': 'Stack', 'selected': false, 'builder': (BuildContext context) => StackPage()},
        {'title': 'Card', 'selected': false, 'builder': (BuildContext context) => CardPage()},
        {'title': 'Pavlova', 'selected': false, 'builder': (BuildContext context) => PavlovaPage()},
        {'title': 'Lake', 'selected': false, 'builder': (BuildContext context) => LakePage()},
      ]
    },
    {
      'title': 'Navigation', 'expanded': false,
      'items': [
        {'title': 'Basic', 'selected': false, 'builder': (BuildContext context) => BasicPage()},
        {'title': 'Send Data', 'selected': false, 'builder': (BuildContext context) => SendDataPage()},
        {'title': 'Return Data', 'selected': false, 'builder': (BuildContext context) => ReturnDataPage()},
        {'title': 'Named Route', 'selected': false, 'builder': (BuildContext context) => NamedRoutePage()},
        {'title': 'Hero', 'selected': false, 'builder': (BuildContext context) => HeroPage()},
        {'title': 'Nested', 'selected': false, 'builder': (BuildContext context) => NestedPage()},
        {'title': 'TabBar', 'selected': false, 'builder': (BuildContext context) => TabBarPage()}
      ]
    },
    {
      'title': 'Ineraction', 'expanded': false,
      'items': [
        {'title': 'AppBar', 'selected': false, 'builder': (BuildContext context) => AppBarPage()},
        {'title': 'Tabbox', 'selected': false, 'builder': (BuildContext context) => TapboxPage()},
        {'title': 'TabBar[Placed]', 'selected': false, 'builder': (BuildContext context) => TabBarPlacedPage()},
        {'title': 'AppBar & TabBar', 'selected': false, 'builder': (BuildContext context) => AppBarTabBarPage()},
        {'title': 'Favorite Lake', 'selected': false, 'builder': (BuildContext context) => FavoriteLakePage()},
        {'title': 'Refresh Indicator', 'selected': false, 'builder': (BuildContext context) => RefreshIndicatorPage()},
        {'title': 'Silver App Bar', 'selected': false, 'builder': (BuildContext context) => SilverAppBarScrollPage()},
        {'title': 'Animated List', 'selected': false, 'builder': (BuildContext context) => AnimateListPage()},
      ]
    }
  ];

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((info) {
      setState(() {
        _packageInfo = info;
      });
    });
  }

  void _resetPanels() {
    _panels.forEach((panel) {
      panel['expanded'] = false;
      (panel['items'] as List<Map<String, Object>>).forEach((item) => {item['selected'] = false});
    });
  }

  void _goHome() {
    _isHome = true;
    _resetPanels();
    Navigator.of(context)..pop()..pushReplacement(MaterialPageRoute(
      builder: (context) => Home()
    ));
  }

  void _onExpand(index, expanded) {
    _resetPanels();
    _panels[index]['expanded'] = !expanded;
    setState(() {});
  }

  void _onSelect(Map<String, Object> panel, Map<String, Object> item) {
    _isHome = false;
    panel['expanded'] = true;
    item['selected'] = true;
    Navigator.of(context)..pop()..pushReplacement(MaterialPageRoute(
      builder: item['builder']
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
            height: 80,
            child: Center(
              child: Text(
                'Flutter Demo',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            )
          ),
          ListTile(
            onTap: _goHome,
            title: Text(
              'Home',
              style: TextStyle(fontSize: 16),
            ),
            selected: _isHome,
            dense: true,
          ),
          ExpansionPanelList(
            expansionCallback: _onExpand,
            children: _panels.asMap().map<int, ExpansionPanel>(
                (index, panel) => MapEntry(
                  index,
                  ExpansionPanel(
                    headerBuilder: (context, expanded) => ListTile(
                      onTap: () => _onExpand(index, panel['expanded']),
                      title: Text(
                        panel['title'],
                        style: TextStyle(fontSize: 16)
                      ),
                      selected: expanded,
                      dense: true
                    ),
                    body: Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        children: (panel['items'] as List<Map<String, Object>>).map<Widget>((item) => ListTile(
                          onTap: () => _onSelect(panel, item),
                          title: Text(item['title']),
                          dense: true,
                          enabled: item['builder'] != null,
                        )).toList()
                      ),
                    ),
                    isExpanded: panel['expanded']
                  )
                )
            ).values.toList()
          ),
          Divider(),
          AboutListTile(
            applicationName: _packageInfo.appName,
            applicationLegalese: 'Copyright © missXb',
            applicationVersion: _packageInfo.version,
            applicationIcon: Icon(Icons.apps),
          )
        ]
      )
    );
  }
}
