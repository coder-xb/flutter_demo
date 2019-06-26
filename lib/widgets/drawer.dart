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
    // Widgets
    {
      'title': 'Widgets',
      'expanded': false,
      'items': [
        {
          'title': 'Align',
          'selected': false,
          'builder': (BuildContext context) => AlignPage()
        },
        {
          'title': 'Bar_AppBar',
          'selected': false,
          'builder': (BuildContext context) => BarAppBar()
        },
        {
          'title': 'Bar_BottomAppBar',
          'selected': false,
          'builder': (BuildContext context) => BarBottomAppBar()
        },
        {
          'title': 'Bar_BottomNavigationBar',
          'selected': false,
          'builder': (BuildContext context) => BottomNavigationBarPage()
        },
        {
          'title': 'Bar_ButtonBar',
          'selected': false,
          'builder': (BuildContext context) => BarButtonBar()
        },
        {
          'title': 'Bar_FlexibleSpaceBar',
          'selected': false,
          'builder': (BuildContext context) => FlexibleSpaceBarPage()
        },
        {
          'title': 'Bar_SliverAppBar',
          'selected': false,
          'builder': (BuildContext context) => SliverAppBarPage()
        },
        {
          'title': 'Bar_SnackBar',
          'selected': false,
          'builder': (BuildContext context) => SnackBarPage()
        },
        {
          'title': 'Bar_TabBar',
          'selected': false,
          'builder': (BuildContext context) => BarTabBarPage()
        },
        {
          'title': 'Box_ConstrainedBox',
          'selected': false,
          'builder': (BuildContext context) => ConstrainedBoxPage()
        },
        {
          'title': 'Box_DecoratedBox',
          'selected': false,
          'builder': (BuildContext context) => DecoratedBoxPage()
        },
        {
          'title': 'Box_FittedBox',
          'selected': false,
          'builder': (BuildContext context) => FittedBoxPage()
        },
        {
          'title': 'Box_OverflowBox',
          'selected': false,
          'builder': (BuildContext context) => OverflowBoxPage()
        },
        {
          'title': 'Box_RotatedBox',
          'selected': false,
          'builder': (BuildContext context) => RotatedBoxPage()
        },
        {
          'title': 'Box_SizedBox',
          'selected': false,
          'builder': (BuildContext context) => SizedBoxPage()
        },
        {
          'title': 'Button_DropdownButton',
          'selected': false,
          'builder': (BuildContext context) => DropdownButtonPage()
        },
        {
          'title': 'Button_FlatButton',
          'selected': false,
          'builder': (BuildContext context) => FlatButtonPage()
        },
        {
          'title': 'Button_FloatingActionButton',
          'selected': false,
          'builder': (BuildContext context) => FloatingActionButtonPage()
        },
        {
          'title': 'Button_IconButton',
          'selected': false,
          'builder': (BuildContext context) => IconButtonPage()
        },
        {
          'title': 'Button_OutlineButton',
          'selected': false,
          'builder': (BuildContext context) => OutlineButtonPage()
        },
        {
          'title': 'Button_RaisedButton',
          'selected': false,
          'builder': (BuildContext context) => RaisedButtonPage()
        },
        {
          'title': 'Button_RawMaterialButton',
          'selected': false,
          'builder': (BuildContext context) => RawMaterialButtonPage()
        },
        {
          'title': 'Button_TotalDemo',
          'selected': false,
          'builder': (BuildContext context) => ButtonDemo()
        },
        {
          'title': 'Card',
          'selected': false,
          'builder': (BuildContext context) => CardsPage()
        },
        {
          'title': 'Checkbox_Checkbox',
          'selected': false,
          'builder': (BuildContext context) => CheckBoxPage()
        },
        {
          'title': 'Checkbox_CheckboxListTile',
          'selected': false,
          'builder': (BuildContext context) => CheckBoxListTilePage()
        },
        {
          'title': 'Chip',
          'selected': false,
          'builder': (BuildContext context) => ChipPage()
        },
        {
          'title': 'Dialog',
          'selected': false,
          'builder': (BuildContext context) => DialogPage()
        },
        {
          'title': 'Dismissible',
          'selected': false,
          'builder': (BuildContext context) => DismissiblePage()
        },
        {
          'title': 'Expanded',
          'selected': false,
          'builder': (BuildContext context) => ExpandedPage()
        },
        {
          'title': 'Grid_GridTile',
          'selected': false,
          'builder': (BuildContext context) => GridTilePage()
        },
        {
          'title': 'Grid_GridView',
          'selected': false,
          'builder': (BuildContext context) => GridViewPage()
        },
        {
          'title': 'Icon_Icon',
          'selected': false,
          'builder': (BuildContext context) => IconPage()
        },
        {
          'title': 'Icon_IconData',
          'selected': false,
          'builder': (BuildContext context) => IconDataPage()
        },
        {
          'title': 'Icon_IconTheme',
          'selected': false,
          'builder': (BuildContext context) => IconThemePage()
        },
        {
          'title': 'Image_AssetImage',
          'selected': false,
          'builder': (BuildContext context) => AssetImagePage()
        },
        {
          'title': 'Image_DecorationImage',
          'selected': false,
          'builder': (BuildContext context) => DecorationImagePage()
        },
        {
          'title': 'Image_FileImage',
          'selected': false,
          'builder': (BuildContext context) => FileImagePage()
        },
        {
          'title': 'Image_Image',
          'selected': false,
          'builder': (BuildContext context) => ImagePage()
        },
        {
          'title': 'Input_TextField',
          'selected': false,
          'builder': (BuildContext context) => TextPage()
        },
        {
          'title': 'Layout_Center',
          'selected': false,
          'builder': (BuildContext context) => CenterPage()
        },
        {
          'title': 'Layout_Column',
          'selected': false,
          'builder': (BuildContext context) => ColumnPage()
        },
        {
          'title': 'Layout_Container',
          'selected': false,
          'builder': (BuildContext context) => WContainerPage()
        },
        {
          'title': 'Layout_Row',
          'selected': false,
          'builder': (BuildContext context) => RowPage()
        },
        {
          'title': 'List_ListBody',
          'selected': false,
          'builder': (BuildContext context) => ListBodyPage()
        },
        {
          'title': 'List_ListView',
          'selected': false,
          'builder': (BuildContext context) => WListViewPage()
        },
        {
          'title': 'Menu_CheckedPopupMenuItem',
          'selected': false,
          'builder': (BuildContext context) => CheckedPopupMenuItemPage()
        },
        {
          'title': 'Menu_DropdownMenuItem',
          'selected': false,
          'builder': (BuildContext context) => DropdownMenuItemPage()
        },
        {
          'title': 'Menu_PopupMenuButton',
          'selected': false,
          'builder': (BuildContext context) => PopupMenuButtonPage()
        },
        {
          'title': 'Picker_DatePicker',
          'selected': false,
          'builder': (BuildContext context) => DatePickerPage()
        },
        {
          'title': 'Progress_ProgreeIndicator',
          'selected': false,
          'builder': (BuildContext context) => ProgressIndicatorPage()
        },
        {
          'title': 'Radio_Radio',
          'selected': false,
          'builder': (BuildContext context) => RadioPage()
        },
        {
          'title': 'Radio_RadioListTile',
          'selected': false,
          'builder': (BuildContext context) => RadioListTilePage()
        },
        {
          'title': 'Scabffold_Material',
          'selected': false,
          'builder': (BuildContext context) => ScaffoldPage()
        },
        {
          'title': 'Scroll_PageView',
          'selected': false,
          'builder': (BuildContext context) => PageViewPage()
        },
        {
          'title': 'Slider_Slider',
          'selected': false,
          'builder': (BuildContext context) => SliderPage()
        },
        {
          'title': 'Slider_SliderTheme',
          'selected': false,
          'builder': (BuildContext context) => SliderThemePage()
        },
        {
          'title': 'Spacing_AnimatedPadding',
          'selected': false,
          'builder': (BuildContext context) => AnimatedPaddingPage()
        },
        {
          'title': 'Spacing_Padding',
          'selected': false,
          'builder': (BuildContext context) => PaddingPage()
        },
        {
          'title': 'Stack_IndexedStack',
          'selected': false,
          'builder': (BuildContext context) => IndexedStackPage()
        },
        {
          'title': 'Stack_Stack',
          'selected': false,
          'builder': (BuildContext context) => StackPage()
        },
        {
          'title': 'Stepper',
          'selected': false,
          'builder': (BuildContext context) => StepperPage()
        },
        {
          'title': 'Switch_AnimatedSwitcher',
          'selected': false,
          'builder': (BuildContext context) => AnimatedSwitcherPage()
        },
        {
          'title': 'Switch_Switch',
          'selected': false,
          'builder': (BuildContext context) => SwitchPage()
        },
        {
          'title': 'Switch_SwitchListTile',
          'selected': false,
          'builder': (BuildContext context) => SwitchListTilePage()
        },
        {
          'title': 'Table_DataTable',
          'selected': false,
          'builder': (BuildContext context) => DataTablePage()
        },
        {
          'title': 'Table_PaginatedDataTable',
          'selected': false,
          'builder': (BuildContext context) => PaginateDataTablePage()
        },
        {
          'title': 'Table_Table',
          'selected': false,
          'builder': (BuildContext context) => TablePage()
        },
        {
          'title': 'Text_RichText',
          'selected': false,
          'builder': (BuildContext context) => RichTextPage()
        },
        {
          'title': 'Text_Text',
          'selected': false,
          'builder': (BuildContext context) => TextPage()
        },
      ]
    },
    // Layout
    {
      'title': 'Layout',
      'expanded': false,
      'items': [
        {
          'title': 'Horizontal&Vertical Align',
          'selected': false,
          'builder': (BuildContext context) => HoriVertAlignPage()
        },
        {
          'title': 'Horizontal&Vertical Sizing',
          'selected': false,
          'builder': (BuildContext context) => HoriVertSizingPage()
        },
        {
          'title': 'Container',
          'selected': false,
          'builder': (BuildContext context) => ContainerPage()
        },
        {
          'title': 'GridView Extent',
          'selected': false,
          'builder': (BuildContext context) => GridViewExtentPage()
        },
        {
          'title': 'GridView Count',
          'selected': false,
          'builder': (BuildContext context) => GridViewCountPage()
        },
        {
          'title': 'ListView',
          'selected': false,
          'builder': (BuildContext context) => ListViewPage()
        },
        {
          'title': 'Stack',
          'selected': false,
          'builder': (BuildContext context) => StackPage()
        },
        {
          'title': 'Card',
          'selected': false,
          'builder': (BuildContext context) => CardPage()
        },
        {
          'title': 'Pavlova',
          'selected': false,
          'builder': (BuildContext context) => PavlovaPage()
        },
        {
          'title': 'Lake',
          'selected': false,
          'builder': (BuildContext context) => LakePage()
        },
        {
          'title': 'Layout',
          'selected': false,
          'builder': (BuildContext context) => LayoutPage()
        },
      ]
    },
    // Navigation
    {
      'title': 'Navigation',
      'expanded': false,
      'items': [
        {
          'title': 'Basic',
          'selected': false,
          'builder': (BuildContext context) => BasicPage()
        },
        {
          'title': 'Send Data',
          'selected': false,
          'builder': (BuildContext context) => SendDataPage()
        },
        {
          'title': 'Return Data',
          'selected': false,
          'builder': (BuildContext context) => ReturnDataPage()
        },
        {
          'title': 'Named Route',
          'selected': false,
          'builder': (BuildContext context) => NamedRoutePage()
        },
        {
          'title': 'Hero',
          'selected': false,
          'builder': (BuildContext context) => HeroPage()
        },
        {
          'title': 'Nested',
          'selected': false,
          'builder': (BuildContext context) => NestedPage()
        },
        {
          'title': 'TabBar',
          'selected': false,
          'builder': (BuildContext context) => TabBarPage()
        }
      ]
    },
    // Ineraction
    {
      'title': 'Ineraction',
      'expanded': false,
      'items': [
        {
          'title': 'Form',
          'selected': false,
          'builder': (BuildContext context) => FormPage()
        },
        {
          'title': 'AppBar',
          'selected': false,
          'builder': (BuildContext context) => AppBarPage()
        },
        {
          'title': 'Tabbox',
          'selected': false,
          'builder': (BuildContext context) => TapboxPage()
        },
        {
          'title': 'TabBar[Placed]',
          'selected': false,
          'builder': (BuildContext context) => TabBarPlacedPage()
        },
        {
          'title': 'BottomSheet',
          'selected': false,
          'builder': (BuildContext context) => BottomSheetPage()
        },
        {
          'title': 'AppBar & TabBar',
          'selected': false,
          'builder': (BuildContext context) => AppBarTabBarPage()
        },
        {
          'title': 'Favorite Lake',
          'selected': false,
          'builder': (BuildContext context) => FavoriteLakePage()
        },
        {
          'title': 'Refresh Indicator',
          'selected': false,
          'builder': (BuildContext context) => RefreshIndicatorPage()
        },
        {
          'title': 'Silver',
          'selected': false,
          'builder': (BuildContext context) => SliverPage()
        },
        {
          'title': 'Silver App Bar',
          'selected': false,
          'builder': (BuildContext context) => SliverAppBarScrollPage()
        },
        {
          'title': 'Animated List',
          'selected': false,
          'builder': (BuildContext context) => AnimateListPage()
        },
      ]
    },
    // Advanced
    {
      'title': 'Advanced',
      'expanded': false,
      'items': [
        {
          'title': 'Animation',
          'selected': false,
          'builder': (BuildContext context) => AnimationPage()
        },
        {
          'title': 'Animation_Basic',
          'selected': false,
          'builder': (BuildContext context) => AnimationBasic()
        },
        {
          'title': 'Animation_Countdown',
          'selected': false,
          'builder': (BuildContext context) => AnimationCountdown()
        },
        {
          'title': 'Animation_Delayed',
          'selected': false,
          'builder': (BuildContext context) => AnimationDelayed()
        },
        {
          'title': 'Animation_Parent',
          'selected': false,
          'builder': (BuildContext context) => AnimationParent()
        },
        {
          'title': 'Animation_Transform',
          'selected': false,
          'builder': (BuildContext context) => AnimationTransform()
        },
        {
          'title': 'Animation_Widget',
          'selected': false,
          'builder': (BuildContext context) => AnimationWidget()
        },
        {
          'title': 'AnimatedContainer',
          'selected': false,
          'builder': (BuildContext context) => AnimatedContainerPage()
        },
        {
          'title': 'AnimatedCrossFade',
          'selected': false,
          'builder': (BuildContext context) => AnimatedCrossFadePage()
        },
        {
          'title': 'BLoC',
          'selected': false,
          'builder': (BuildContext context) => BlocPage()
        },
        {
          'title': 'RxDart [Simple]',
          'selected': false,
          'builder': (BuildContext context) => RxDartSimple()
        },
        {
          'title': 'RxDart BLoC',
          'selected': false,
          'builder': (BuildContext context) => RxDartBlocPage()
        },
      ]
    },
    {
      'title': 'UI Demos',
      'expanded': false,
      'items': [
        {
          'title': 'AudioDemo',
          'selected': false,
          'builder': (BuildContext context) => AudioPage()
        },
        {
          'title': 'BackToTop',
          'selected': false,
          'builder': (BuildContext context) => BackToTop()
        },
        {
          'title': 'BottomNavigationNormal',
          'selected': false,
          'builder': (BuildContext context) => BottomNavigationNormal()
        },
        {
          'title': 'BottomNavigationKeepAlive',
          'selected': false,
          'builder': (BuildContext context) => BottomNavigationKeep()
        },
        {
          'title': 'ChatPage',
          'selected': false,
          'builder': (BuildContext context) => ChatPage()
        },
        {
          'title': 'CustomClipper',
          'selected': false,
          'builder': (BuildContext context) => CustomClipperPage()
        },
        {
          'title': 'CustomRouter',
          'selected': false,
          'builder': (BuildContext context) => CustomRouterPage()
        },
        {
          'title': 'Draggable',
          'selected': false,
          'builder': (BuildContext context) => DraggablePage()
        },
        {
          'title': 'ExpansionTile',
          'selected': false,
          'builder': (BuildContext context) => ExpansionTileDemo()
        },
        {
          'title': 'ExpansionPanelList',
          'selected': false,
          'builder': (BuildContext context) => ExpansionPanelListDemo()
        },
        {
          'title': 'FormPopScpoePage',
          'selected': false,
          'builder': (BuildContext context) => FormPopScpoePage()
        },
        {
          'title': 'FrostedGlass',
          'selected': false,
          'builder': (BuildContext context) => FrostedGlass()
        },
        {
          'title': 'Hero',
          'selected': false,
          'builder': (BuildContext context) => HeroDemoPage()
        },
        {
          'title': 'HideBottomBar',
          'selected': false,
          'builder': (BuildContext context) => HideBottomBarPage()
        },
        {
          'title': 'ReorderableListView',
          'selected': false,
          'builder': (BuildContext context) => ReorderableListViewPage()
        },
        /*{
          'title': 'RotateButton',
          'selected': false,
          'builder': (BuildContext context) => RotateButtonPage()
        },*/
        {
          'title': 'PullDownRefresh',
          'selected': false,
          'builder': (BuildContext context) => PullDownPage()
        },
        {
          'title': 'PullUpLoading',
          'selected': false,
          'builder': (BuildContext context) => PullUpPage()
        },
        {
          'title': 'SearchBar',
          'selected': false,
          'builder': (BuildContext context) => SearchBar()
        },
        {
          'title': 'SliverPgae',
          'selected': false,
          'builder': (BuildContext context) => SliverPgae()
        },
        {
          'title': 'TextFieldsFocus',
          'selected': false,
          'builder': (BuildContext context) => TextFieldsFocus()
        },
        {
          'title': 'WidgetToImage',
          'selected': false,
          'builder': (BuildContext context) => WidgetToImage()
        },
        {
          'title': 'WillPopScpoe',
          'selected': false,
          'builder': (BuildContext context) => WillPopScpoePage()
        },
        {
          'title': 'WrapPhoto',
          'selected': false,
          'builder': (BuildContext context) => WrapPhoto()
        }
      ]
    },
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
      (panel['items'] as List<Map<String, Object>>)
          .forEach((item) => {item['selected'] = false});
    });
  }

  void _goHome() {
    _isHome = true;
    _resetPanels();
    Navigator.of(context)
      ..pop()
      ..pushReplacement(MaterialPageRoute(builder: (context) => Home()));
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
    Navigator.of(context)
      ..pop()
      ..pushReplacement(MaterialPageRoute(builder: item['builder']));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // 带有用户信息的DrawerHeader
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            // 用户名称
            accountName: Text(
              'missXb [ ℃oder~小波 ]',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // 用户邮箱
            accountEmail: Text('lxb3258@foxmail.com'),
            // 用户头像
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/lake.jpg'),
            ),
            // 装饰器
            decoration: BoxDecoration(
              color: Colors.blueGrey[400],
              image: DecorationImage(
                image: AssetImage('assets/images/lake.jpg'),
                fit: BoxFit.cover,

                /// 背景图遮罩蒙版 ColorFilter.mode(Color, BlenMode)
                /// BlendMode.* 图像混合模式
                /// BlendMode.clear       清除所有内容
                /// BlendMode.src         只显示源图像
                /// BlendMode.dst         只显示目标图像
                /// BlendMode.srcOver     [默认值]将src与dst进行组合，如果src和dst有重叠的地方，则以src内容覆盖与dst重叠的地方
                /// BlendMode.dstOver     与srcOver相反
                /// BlendMode.srcIn       只显示src和dst重合部分，且dst的重合部分不透明有用
                /// BlendMode.dstIn       只显示src和dst重合部分，且src的重合部分不透明度用
                /// BlendMode.srcOut      显示src图像，但只显示src和dst的不重合部分，且重合部分只有dst不透明才算重合
                /// BlendMode.dstOut      显示dst图像，但只显示src和dst的不重合部分，且重合部分只有src不透明才算重合
                /// BlendMode.srcATop     将src与dst进行组合，但只组合src和dst重合部分，不重合部分显示dst
                /// BlendMode.dstATop     将src与dst进行组合，但只组合src和dst重合部分，不重合部分显示src
                /// BlendMode.xor         显示src和dst不重合部分，重合部分不显示
                /// BlendMode.plus        混合src和dst，其中src的颜色透明度降低
                /// BlendMode.modulate    将src和dst重叠部分混合，使混合部分颜色相乘，这只能导致相同或更深的颜色(乘以白色，1.0，结果没有变化;乘以黑色，得到黑色)。
                ///                       当合成两个不透明的图像时，其效果类似于将屏幕上的两个透明度重叠。如果src或dst考虑透明度，可以使用[multiply]
                /// BlendMode.screen      将src图像和dst图像的分量的倒数相乘，并将结果的倒数相乘。
                ///                       反转组件意味着将完全饱和通道(不透明的白色)视为值0.0，而通常将值0.0(黑色、透明)视为值1.0。
                ///                       这与[modulate]混合模式本质上是相同的，但是在乘法运算之前颜色的值是倒过来的，在渲染之前结果是倒过来的。
                ///                       这只能导致相同或更浅的颜色(乘以黑色，1.0，结果没有变化;乘以白色，0.0，结果是白色)。
                ///                       同样，在alpha通道中，它只能产生更不透明的颜色。这与两个同时在同一屏幕上显示图像的投影仪有相似的效果
                /// BlendMode.overlay     将src图像和dst图像的组件相乘，然后调整它们以适应dst。
                ///                       具体来说，如果dst值更小，则将其与src值相乘，而src值更小，则将src值的倒数与dst值的倒数相乘，然后将结果相乘。
                ///                       反转组件意味着将完全饱和的通道(不透明的白色)视为值0.0，而通常将值0.0(黑色、透明)视为值1.0。
                /// BlendMode.lighten     通过从每个颜色通道中选择最小值来组合源图像和目标图像。输出图像的不透明度计算方法与[srcOver]相同。
                /// BlendMode.colorDodge  用src的倒数除以dst。反转组件意味着将完全饱和通道(不透明的白色)视为值0.0，而通常将值0.0(黑色、透明)视为值1.0
                /// BlendMode.colorBurn   用dst函数的倒数除以src函数的倒数，然后求结果的倒数。反转组件意味着将完全饱和通道(不透明的白色)视为值0.0，而通常将值0.0(黑色、透明)视为值1.0。
                /// BlendMode.hardLight   将src图像和dst图像的组件相乘，然后对它们进行调整，使之有利于src。
                ///                       具体来说，如果src值更小，则将其与dst值相乘，而如果dst值更小，则将dst值的倒数与src值的倒数相乘，然后将结果相乘。
                ///                       反转组件意味着将完全饱和通道(不透明的白色)视为值0.0，而通常将值0.0(黑色、透明)视为值1.0。
                /// BlendMode.softLight   对于小于0.5的src值使用[colorDodge]，对于大于0.5的src值使用[colorBurn]。这导致了与[overlay]相似但更柔和的效果。
                /// BlendMode.difference  从每个通道的大值中减去小值。合成黑色没有效果;合成白色使另一幅图像的颜色相反。
                ///                       输出图像的不透明度计算方法与[srcOver]相同。这种影响类似[exclusion]，但更为严重。
                /// BlendMode.exclusion   从两个图像的和中减去两个图像的乘积的两倍。合成黑色没有效果;合成白色使另一幅图像的颜色相反。
                ///                       输出图像的不透明度计算方法与[srcOver]相同。效果类似[difference]，但更柔和。
                /// BlendMode.multiply    将src图像和dst图像的组件相乘，包括alpha通道。
                ///                       这只能导致相同或更深的颜色(乘以白色，1.0，结果没有变化;乘以黑色，得到黑色)。
                ///                       由于alpha通道也是相乘的，在一个图像中一个完全透明的像素(不透明度0.0)会导致输出中一个完全透明的像素。
                ///                       这与[dstIn]很相似，但是颜色混合了。如果src和dst都没有透明度，则可以使用[modulate]
                /// BlendMode.hue         取src图像的色调，以及dst图像的饱和度和亮度。其效果是将dst图像与src图像着色。
                ///                       输出图像的不透明度计算方法与[srcOver]相同。在src图像中完全透明的区域从dst图像中获取它们的色调。
                /// BlendMode.saturation  取src图像的饱和度，以及dst图像的色调和亮度。
                ///                       输出图像的不透明度计算方法与[srcOver]相同。在src图像中完全透明的区域从dst图像中获取饱和度。
                /// BlendMode.color       取src图像的色调和饱和度，以及dst图像的亮度。其效果是将dst图像与src图像着色。
                ///                       输出图像的不透明度计算方法与[srcOver]相同。在src图像中完全透明的区域从dst图像中获取它们的色调和饱和度。
                /// BlendMode.luminosity  取src图像的亮度，以及dst图像的色调和饱和度。
                ///                       输出图像的不透明度计算方法与[srcOver]相同。在src图像中完全透明的区域从dst图像中获取亮度
                colorFilter: ColorFilter.mode(
                    Colors.blueGrey[400].withOpacity(0.6), BlendMode.srcOver),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
            height: 80,
            child: Center(
              child: Text(
                'Flutter Demo',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
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
              children: _panels
                  .asMap()
                  .map<int, ExpansionPanel>(
                    (index, panel) => MapEntry(
                          index,
                          ExpansionPanel(
                            headerBuilder: (context, expanded) => ListTile(
                                  onTap: () =>
                                      _onExpand(index, panel['expanded']),
                                  title: Text(
                                    panel['title'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  selected: expanded,
                                  dense: true,
                                ),
                            body: Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                children: (panel['items']
                                        as List<Map<String, Object>>)
                                    .map<Widget>((item) => ListTile(
                                          onTap: () => _onSelect(panel, item),
                                          title: Text(item['title']),
                                          dense: true,
                                          enabled: item['builder'] != null,
                                        ))
                                    .toList(),
                              ),
                            ),
                            isExpanded: panel['expanded'],
                          ),
                        ),
                  )
                  .values
                  .toList()),
          Divider(),
          ListTile(
            subtitle: Text('本项目部分Demo摘自：https://github.com/OpenFlutter/Flutter-Notebook'),
          ),
          Divider(),
          AboutListTile(
            applicationName: _packageInfo.appName,
            applicationLegalese: 'Copyright © missXb',
            applicationVersion: _packageInfo.version,
            applicationIcon: Icon(Icons.apps),
          )
        ],
      ),
    );
  }
}
