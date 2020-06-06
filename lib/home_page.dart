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
      body: Column(
        children: <Widget>[
          Padding(
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
                  control:
                      new SwiperControl(iconNext: null, iconPrevious: null),
                  autoplay: true,
                  loop: true,
                ),
              )),
          SizedBox(
              height: 100,
              child: GridView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.0 //宽高比为1时，子widget
                      ),
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
                  ])),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text("工会资讯"),
                    Text("看.新闻资讯", style: TextStyle(height: 2.2))
                  ],
                ),
                Column(
                  children: [
                    Text("工会资讯"),
                    Text("看.新闻资讯", style: TextStyle(height: 2.2))
                  ],
                ),
                Column(
                  children: [
                    Text("工会资讯"),
                    Text("看.新闻资讯", style: TextStyle(height: 2.2))
                  ],
                ),
                Column(
                  children: [
                    Text("工会资讯"),
                    Text("看.新闻资讯", style: TextStyle(height: 2.2))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
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
                    control:
                        new SwiperControl(iconNext: null, iconPrevious: null),
                    autoplay: true,
                    loop: true,
                  ),
                )),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("标题"), leading: Text("不知道是啥"));
                  }))
        ],
      ),
    );
  }

  void _onClick() {}
}
