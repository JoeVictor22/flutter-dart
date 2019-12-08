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
  List _categorys = new List();
  var _category_selected = 0;
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
        color: defaultColor,
        child: new Column(
          children: <Widget>[
            _getListCategory(),
            new Expanded(
              child: _getListViewWidget(),
            )
          ],
        ),
      ),
      bottomNavigationBar: _getBottomNavigator(),
    );

  }

  @override
  void initState() {

    setCategorys();
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
            item['tittle'],
            item['date']
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

  void setCategorys() {

    _categorys.add("Geral");
    _categorys.add("Categoria 1");
    _categorys.add("Categoria 2");
    _categorys.add("Categoria 3");
    _categorys.add("Categoria 4");
    _categorys.add("Categoria 5");

  }

  Widget _getListCategory(){

    ListView listCategory = new ListView.builder(
        itemCount: _categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return _buildCategoryItem(index);
        }
    );

    return new Container(
      height: 55.0,
      child: listCategory,
    );

  }

  onTabCategory(index) {
    setState(() {
      _category_selected = index;
    });
  }

  Widget _buildCategoryItem(index){

    return new GestureDetector(
      onTap: (){
        onTabCategory(index);
      },
      child: new Center(
        child: new Container(
          margin: new EdgeInsets.only(left: 5.0, right: 5),
          child: new Material(
            elevation: 2.0,
            borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
            child:  new Container(
              padding: new EdgeInsets.only(left: 12.0,top: 7.0,bottom: 7.0,right: 12.0),
              color: _category_selected == index ? Colors.black:Colors.black,
              child: new Text(_categorys[index],
                style: new TextStyle(
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

}