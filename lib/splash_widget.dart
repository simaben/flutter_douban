import 'dart:async';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/screen_utils.dart';
import 'package:flutter_hello/container_page.dart';

class SplashWidget extends StatefulWidget {
  SplashWidget({Key key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  var container = ContainerPage();
  bool showAd;
  @override
  void initState() {
    super.initState();
    showAd = SpUtil.getBool("showAd");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
            child: Container(
              color: Colors.white,
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          '落花有意随流水,流水无心恋落花',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 30.0, top: 20.0),
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 2.0,
                                  bottom: 2.0),
                              child: CountDownWidget(
                                onCountDownFinishCallBack: (bool value) {
                                  if (value) {
                                    setState(() {
                                      showAd = false;
                                      SpUtil.putBool("showAd", showAd);
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffEDEDED),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Hi,豆芽',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ))
                      ]),
                )
              ]),
              width: ScreenUtils.screenW(context),
              height: ScreenUtils.screenH(context),
            ),
            offstage: !showAd)
      ],
    );
  }

}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
