import 'package:flutter/material.dart';
import 'Notice.dart';
import 'NewsApi.dart';

class NoticeList extends StatefulWidget{

  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;

}

class _NoticeListPageState extends State<NoticeList>{

  List _news = new List();
  var repository = new NewsApi();

  @override
  Widget build(BuildContext context) {

    var color = Color.fromRGBO(10, 10, 10, 30);
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("News"),
        backgroundColor: color,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add news source',
            onPressed: () {//
              // ao ser pressionado, ir para tela de adição de jornais a serem buscados
              },
          ),
        ],
      ),
      body: new Container(
        child: _getListViewWidget(),
        color: color,
      ),
    );

  }

  @override
  void initState() {

    loadNotices();

  }

  Widget _getListViewWidget(){

    var list = new ListView.builder(
        itemCount: _news.length,
        padding: new EdgeInsets.only(top:0.0, bottom: 15),
        itemBuilder: (context, index){
          return _news[index];
        }
    );

    return list;
  }

  loadNotices() async{

    List result = await repository.loadNews();

    setState(() {
      result.forEach((item) {
        var notice = new Notice(
            item['url_img'],
            item['tittle']
        );
        _news.add(notice);

      });

    });

  }

}