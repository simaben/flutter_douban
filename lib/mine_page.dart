import 'package:flutter/material.dart';
import 'package:flutter_hello/load_image.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin{
  var _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.room_service),
            onPressed: _onClick,
          ),
          IconButton(
            icon: Icon(Icons.settings),
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
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          //头像半径
                          radius: 35,
                          //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                          backgroundImage: NetworkImage(
                              'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                        ),
                      ),
                      Text(
                        '张三',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text("我的订单"),
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("查看全部订单"))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: LoadAssetImage(
                                      "icon_waitpass",
                                      width: 30,
                                      height: 30,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text('代付款'),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: LoadAssetImage(
                                      "icon_waitpass",
                                      width: 30,
                                      height: 30,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text('代付款'),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: LoadAssetImage(
                                      "icon_waitpass",
                                      width: 30,
                                      height: 30,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text('代付款'),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: LoadAssetImage(
                                      "icon_waitpass",
                                      width: 30,
                                      height: 30,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text('代付款'),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: LoadAssetImage(
                              'img_my_icon_01',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text('会员认证'),
                          )),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: LoadAssetImage(
                              'icon_arrow_right',
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: LoadAssetImage(
                              'img_my_icon_01',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text('会员认证'),
                          )),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: LoadAssetImage(
                              'icon_arrow_right',
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: LoadAssetImage(
                              'img_my_icon_01',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text('会员认证'),
                          )),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: LoadAssetImage(
                              'icon_arrow_right',
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: LoadAssetImage(
                              'img_my_icon_01',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text('会员认证'),
                          )),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: LoadAssetImage(
                              'icon_arrow_right',
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: LoadAssetImage(
                              'img_my_icon_01',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text('会员认证'),
                          )),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: LoadAssetImage(
                              'icon_arrow_right',
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: LoadAssetImage(
                              'img_my_icon_01',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text('会员认证'),
                          )),
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: LoadAssetImage(
                              'icon_arrow_right',
                              width: 15,
                              height: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ))),
    );
  }

  Future<void> _onRefresh() async {
    return null;
  }

  void _onClick() {}

  @override
  bool get wantKeepAlive => true; //保持页面状态 重写方法

}
