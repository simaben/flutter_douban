import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/colors.dart';
import 'package:flutter_hello/dimens.dart';
import 'package:flutter_hello/home_page.dart';
import 'package:flutter_hello/load_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> _pageList;
  List<BottomNavigationBarItem> _list;
  final PageController _pageController = PageController();
  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);
  int _selectIndex = 0;
  final List<String> _appBarTitles = ['首页', '服务', '商城', '我的'];

  @override
  void initState() {
    super.initState();
    _pageList = [HomePage(), HomePage(), HomePage(), HomePage()];
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectIndex = index;
    });
    _pageController.jumpToPage(_selectIndex);
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      var _tabImages = [
        [
          const LoadAssetImage(
            'img_foot_1',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'img_foot_1',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadAssetImage(
            'img_foot_2',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'img_foot_2',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadAssetImage(
            'img_foot_3',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'img_foot_3',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadAssetImage(
            'img_foot_4',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'img_foot_4',
            width: 25.0,
            color: Colours.app_main,
          ),
        ]
      ];
      _list = List.generate(4, (i) {
        return BottomNavigationBarItem(
            icon: _tabImages[i][0],
            activeIcon: _tabImages[i][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 1.5),
              child: Text(
                _appBarTitles[i],
                key: Key(_appBarTitles[i]),
              ),
            ));
      });
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5.0,
          iconSize: 21.0,
          currentIndex: _selectIndex,
          selectedFontSize: Dimens.font_sp10,
          unselectedFontSize: Dimens.font_sp10,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colours.unselected_item_color,
          type: BottomNavigationBarType.fixed,
          items: _buildBottomNavigationBarItem(),
          onTap: _onPageChanged),
    );
  }
}
