import 'package:flutter/material.dart';
import 'NoticeList.dart';

void main() => runApp(new NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'News',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new NoticeList(),
    );
  }

}