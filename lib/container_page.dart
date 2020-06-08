import 'package:flutter/material.dart';
import 'package:flutter_hello/home_page.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> pages;
  List<BottomNavigationBarItem> itemList;
  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _Item('服务', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _Item('商城', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [HomePage(), HomePage(), HomePage(), HomePage()];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((e) => BottomNavigationBarItem(
              icon: Image.asset(e.normalIcon, width: 30.0, height: 30.0),
              title: Text(e.name, style: TextStyle(fontSize: 20.0)),
              activeIcon: Image.asset(e.activeIcon, width: 30.0, height: 30.0)))
          .toList();
    }
  }

  int _selectIndex = 0;

  //Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _getPagesWidget(0),
        _getPagesWidget(1),
        _getPagesWidget(2),
        _getPagesWidget(3),
      ]),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        selectedFontSize: 9,
        unselectedFontSize: 9,
        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
