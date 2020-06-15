import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
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
    );
  }
  void _onClick() {}
}
