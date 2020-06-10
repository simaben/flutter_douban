import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => _renderListItem(context, index)));
  }

  void _onClick() {}

  _renderListItem(BuildContext context, int index) {
    if (index == 0) {
      return new Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 150,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  "http://via.placeholder.com/350x150",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: new SwiperPagination(),
              control: new SwiperControl(iconNext: null, iconPrevious: null),
              autoplay: true,
              loop: true,
            ),
          ));
    } else if (index == 1) {
      return new SizedBox(
          height: 160,
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            childAspectRatio: 1.0,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.cake),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive)
            ],
          ));
    } else if (index == 2) {
      return new SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          "新闻资讯",
                          softWrap: false,
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text("看.新闻资讯",
                            style: TextStyle(height: 2.2, fontSize: 11.0),
                            softWrap: false)
                      ],
                    ))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Text(
                      "新闻资讯",
                      softWrap: false,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Text("看.新闻资讯",
                        style: TextStyle(height: 2.2, fontSize: 11.0),
                        softWrap: false)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Text(
                      "新闻资讯",
                      softWrap: false,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Text("看.新闻资讯",
                        style: TextStyle(height: 2.2, fontSize: 11.0),
                        softWrap: false)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Text(
                      "新闻资讯",
                      softWrap: false,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Text("看.新闻资讯",
                        style: TextStyle(height: 2.2, fontSize: 11.0),
                        softWrap: false)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else if (index == 3) {
      return SizedBox(
        height: 80,
        child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: SizedBox(
              height: 50,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    "http://via.placeholder.com/350x80",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                pagination: new SwiperPagination(),
                control: new SwiperControl(iconNext: null, iconPrevious: null),
                loop: true,
              ),
            )),
      );
    } else {
      return ListTile(title: Text("标题"), leading: Text("不知道是啥"));
    }
  }
}
