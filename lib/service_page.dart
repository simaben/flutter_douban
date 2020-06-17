import 'dart:collection';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/load_image.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  Map<String, List<String>> tabSegments = Map();
  var currentIndex = 0;
  var _tabSelectedBorder =
      Border(bottom: BorderSide(width: 2, color: Colors.redAccent));
  var _tabUnSelectedBorder =
      Border(bottom: BorderSide(width: 2, color: Colors.transparent));
  var _tabSelectedStyle = TextStyle(fontSize: 17, height: 2);
  var _tabUnSelectedStyle = TextStyle(fontSize: 16, height: 2);

  @override
  void initState() {
    super.initState();
    tabSegments["工会资讯"] = ["时政要闻", "工作动态", "公告通知"];
    tabSegments["学习之窗"] = ["公告通知"];
    tabSegments["会员福利"] = ["工作动态", "工作动态"];
    tabSegments["政治引领"] = ["工作动态", "时政要闻", "工作动态"];
    tabSegments["劳模风采"] = ["工作动态", "时政要闻"];
    tabSegments["劳动竞赛"] = ["工作动态", "时政要闻", "工作动态", "工作动态", "时政要闻", "工作动态"];
    tabSegments["权益保障"] = ["工作动态"];
    tabSegments["就业创业"] = ["工作动态", "时政要闻", "工作动态"];
    tabSegments["职工文化"] = ["工作动态", "时政要闻", "工作动态"];
    tabSegments["视频专栏"] = ["工作动态", "时政要闻", "工作动态"];
    tabSegments["会员活动"] = ["工作动态", "时政要闻", "工作动态"];
    tabSegments["创新联盟"] = ["工作动态", "时政要闻", "工作动态"];
    tabSegments["入会转会"] = ["工作动态", "时政要闻", "工作动态"];
    tabSegments["女工之家"] = ["工作动态", "时政要闻", "工作动态"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("服务"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int index) {
                return _itemServiceTabSegment(ctx, index);
              },
              itemCount: tabSegments.length,
              addAutomaticKeepAlives: true,
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: tabSegments.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return _itemTabChild(ctx, index);
                  }))
        ],
      ),
    );
  }

  _itemTabChild(BuildContext ctx, int index) {
    LogUtil.v("index:$index");
    String title = tabSegments.keys.elementAt(index);
    LogUtil.v("title:$title");
    List<String> tabChild = tabSegments.values.elementAt(index);
    LogUtil.v("tabChild:$tabChild");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: TextStyle(height: 2),
            textAlign: TextAlign.left,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1.0),
          itemBuilder: (BuildContext ctx, int index) {
            return InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: LoadAssetImage(
                      'icon_home_1',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Text(tabChild[index])
                ],
              ),
            );
          },
          itemCount: tabChild.length,
        )
      ],
    );
  }

  _itemServiceTabSegment(BuildContext ctx, int index) {
    String title = tabSegments.keys.elementAt(index);
    return InkWell(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: Container(
          height: 40,
          width: 70,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: currentIndex == index
                  ? _tabSelectedBorder
                  : _tabUnSelectedBorder),
          child: Text(
            title,
            style:
                currentIndex == index ? _tabSelectedStyle : _tabUnSelectedStyle,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
