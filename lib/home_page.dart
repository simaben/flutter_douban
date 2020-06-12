import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_hello/constant.dart';
import 'package:flutter_hello/model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_hello/load_image.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerModel> banners = List();
  List<News> newsList = List();
  List<HomeIcon> homeIcons = List();
  List<HomeTab> homeTabs = List();
  var _scrollController = ScrollController(initialScrollOffset: 50.0);
  EasyRefreshController _easyRefreshController = EasyRefreshController();
  SwiperController _swiperController = SwiperController();

  double homeIconSpace = 0.0;
  double homeTabSpace = 5.0;
  double homeTabSize = 0.0;
  double iconSize = 50.0;
  static const int ROW = 4;

  @override
  void initState() {
    super.initState();
    _getBanner();
    _getHomeIcon();
    _getHomeNews();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _easyRefreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    homeIconSpace =
        (MediaQuery.of(context).size.width - (iconSize * ROW)) / (ROW * 2);
    homeTabSize = MediaQuery.of(context).size.width / ROW - homeTabSpace;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: _onClick,
            ),
            IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: _onClick,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Swiper(
                    key: UniqueKey(),
                    controller: _swiperController,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        banners[index].banner,
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: banners.length,
                    pagination: new SwiperPagination(),
                    control:
                        new SwiperControl(iconNext: null, iconPrevious: null),
                    autoplay: true,
                    loop: true,
                  ),
                ),
                SizedBox(
                    height: 150,
                    child: GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.horizontal,
                      mainAxisSpacing: homeIconSpace,
                      childAspectRatio: 1.0,
                      children: _renderHomeIcons(),
                    )),
                SizedBox(
                    height: 100,
                    child: Row(
                      children: _renderHomeTabs(),
                    )),
                SizedBox(
                  height: 100,
                  child: Swiper(
                    key: UniqueKey(),
                    controller: _swiperController,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        banners[index].banner,
                        fit: BoxFit.fill,
                      );
                    },
                    autoplay: false,
                    loop: false,
                    itemCount: banners.length,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext ctx, int index) {
                      return _renderHomeNewsList(ctx, index);
                    },
                    itemCount: newsList.length,
                    addAutomaticKeepAlives: true)
              ],
            ),
          ),
        )
        );
  }

  void _onClick() {}

  _renderHomeTabs() {
    return homeTabs
        .map((element) => Container(
            margin: EdgeInsets.only(left: homeTabSpace, top: 10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: homeTabSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(element.name), Text(element.subhead)],
            )))
        .toList();
  }

  _renderHomeNewsList(BuildContext ctx, int index) {
    var item = newsList[index];
    return ListTile(
        trailing: LoadImage(item.img),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.black),
        ));
  }

  _renderHomeIcons() {
    List<Widget> childList = List();
    homeIcons.forEach((element) {
      var child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LoadImage(
            element.img,
            width: iconSize,
            height: iconSize,
          ),
          Text(element.name)
        ],
      );
      childList.add(child);
    });
    return childList;
  }

  void _getBanner() {
    var tag = "banner";
    Constant.httpManager
        .getAsync(url: "/home/banner", tag: tag)
        .then((value) => parserData(value, tag));
  }

  void _getHomeIcon() {
    var tag = "icon";
    Constant.httpManager
        .getAsync(url: "/home/icon", tag: tag)
        .then((value) => parserData(value, tag));
  }

  void _getHomeNews() {
    var tag = "home_news";
    Constant.httpManager
        .getAsync(url: "/news/list", tag: tag)
        .then((value) => parserData(value, tag));
  }

  void parserData(Response response, String tag) {
    Map<String, dynamic> data = response.data;
    if (tag == "banner") {
      List<dynamic> list = data['data'];
      if (list != null) {
        banners.clear();
        list.forEach((element) {
          var responseModel = BannerModel.fromJson(element);
          banners.add(responseModel);
        });
      }
    } else if (tag == "icon") {
      List<dynamic> list = data['data']['home'];
      if (list != null) {
        homeIcons.clear();
        list.forEach((element) {
          var homeIcon = HomeIcon.fromJson(element);
          homeIcons.add(homeIcon);
        });
      }
      List<dynamic> tabs = data['data']['tab'];
      if (tabs != null) {
        tabs.forEach((element) {
          var homeTab = HomeTab.fromJson(element);
          homeTabs.add(homeTab);
        });
      }
    } else if (tag == "home_news") {
      Map<String, dynamic> map = data['data'];
      print(map);
      if (map != null) {
        List<dynamic> list = map['rows'];
        newsList.clear();
        list.forEach((element) {
          var news = News.fromJson(element);
          newsList.add(news);
        });
      }
    }
    setState(() {});
  }

  Future<void> _onRefresh() async {
    return null;
  }

  _onLoad() {}
}
