import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/constant.dart';
import 'package:flutter_hello/load_image.dart';
import 'package:flutter_hello/model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<BannerModel> banners = List();
  var _scrollController = ScrollController();
  SwiperController _swiperController = SwiperController();

  @override
  void initState() {
    super.initState();
    _getBanner();
  }

  void _getBanner() {
    var tag = "banner";
    Constant.httpManager
        .getAsync(url: "/home/banner", tag: tag)
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
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("商城"),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
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
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 5),
                          child: InkWell(
                            child: LoadAssetImage(
                              'icon_ad_1',
                            ),
                          )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
                      child: InkWell(
                        child: LoadAssetImage('icon_ad_2'),
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 160,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("积分专区"),
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 70,
                            height: 20,
                            //居中
                            alignment: Alignment(0, 0),
                            decoration: BoxDecoration(
                                //边框
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                //圆角
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              "查看全部",
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: GridView.builder(
                          addAutomaticKeepAlives: true,
                          physics: new NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.0),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return _itemGoods();
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 160,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("商品专区"),
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 70,
                            height: 20,
                            //居中
                            alignment: Alignment(0, 0),
                            decoration: BoxDecoration(
                                //边框
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                //圆角
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              "查看全部",
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: GridView.builder(
                          addAutomaticKeepAlives: true,
                          physics: new NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.0),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return _itemGoods();
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    return null;
  }

  _itemGoods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: LoadAssetImage(
            "details_commodity_01",
            height: 80,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'aaa',
            style: TextStyle(fontSize: 11),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'aaa',
            style: TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }

  void _onClick() {}
}
