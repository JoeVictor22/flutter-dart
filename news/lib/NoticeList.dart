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
  var _currentIndex = 0;
  var defaultColor = Color.fromRGBO(10, 10, 10, 30);

  @override
  Widget build(BuildContext context) {



    return new Scaffold(
      appBar: new AppBar(
        title: const Text("News"),
        backgroundColor: defaultColor,
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
        color: defaultColor,
      ),
        bottomNavigationBar: _getBottomNavigator()
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
  Widget _getBottomNavigator() {

    return new BottomNavigationBar(
      onTap: onTabTapped, // new
      currentIndex: _currentIndex, // new
      type: BottomNavigationBarType.shifting,
      items: [
        new BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            title: Text('Recentes'),
            backgroundColor: defaultColor
        ),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: Text('Salvos'),
            backgroundColor: defaultColor
        )
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}