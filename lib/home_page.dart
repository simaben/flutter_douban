import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_hello/constant.dart';
import 'package:flutter_hello/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_hello/load_image.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerModel> banners = List();
  List<News> newsList = List();
  List<HomeIcon> homeIcons = List();
  List<HomeTab> homeTabs = List();
  var _scrollController = ScrollController(initialScrollOffset: 0.0);
  EasyRefreshController _easyRefreshController = EasyRefreshController();
  SwiperController _swiperController = SwiperController();

  static const int ROW = 4;
  double homeIconWidth = 0;
  double homeIconSize = ScreenUtil().setWidth(80);

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
    homeIconWidth = ScreenUtil.screenWidth / ROW;
    LogUtil.v("homeIconWidth:$homeIconWidth");
    LogUtil.v("homeIconSize/homeIconWidth:${homeIconSize / homeIconWidth}");
    return Scaffold(
        backgroundColor: Constant.bgColor,
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
                  height: ScreenUtil().setHeight(300),
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
                Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: ScreenUtil().setHeight(300),
                    child: GridView.count(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      scrollDirection: Axis.horizontal,
                      children: _renderHomeIcons(),
                    )),
                Container(
                    margin: EdgeInsets.only(right: 10, top: 10, bottom: 10.0),
                    height: ScreenUtil().setHeight(130),
                    child: Row(
                      children: _renderHomeTabs(),
                    )),
                SizedBox(
                  height: ScreenUtil().setHeight(200),
                  child: Swiper(
                    key: UniqueKey(),
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        banners[index].banner,
                        fit: BoxFit.cover,
                      );
                    },
                    autoplay: false,
                    loop: false,
                    autoplayDisableOnInteraction: true,
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
        ));
  }

  void _onClick() {}

  _renderHomeTabs() {
    return homeTabs
        .map((element) => Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        element.name,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                        ),
                      )),
                      Expanded(
                        child: Text(
                          element.subhead,
                          style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                        ),
                      )
                    ],
                  )),
            ))
        .toList();
  }

  _renderHomeNewsList(BuildContext ctx, int index) {
    var item = newsList[index];
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListTile(
          trailing: LoadImage(item.img),
          title: Text(
            item.title,
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(23, allowFontScalingSelf: true)),
          )),
    );
  }

  _renderHomeIcons() {
    return homeIcons
        .map((element) => Container(
            width: homeIconWidth,
            child: Column(
              children: <Widget>[
                LoadImage(
                  element.img,
                  width: homeIconSize,
                  height: homeIconSize,
                ),
                Container(
                  height: ScreenUtil().setHeight(40),
                  child: Text(
                    element.name,
                    style: TextStyle(
                        fontSize:
                            ScreenUtil().setSp(22, allowFontScalingSelf: true)),
                  ),
                )
              ],
            )))
        .toList();
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

  @override
  bool get wantKeepAlive => true; //保持页面状态 重写方法

}
