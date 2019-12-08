import 'package:flutter/material.dart';

class NoticeView extends StatelessWidget{

  var _img;
  var _title;
  var _date;
  var _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus elit quis nisl rhoncus elementum. Morbi neque leo, dignissim sit amet lectus sit amet, cursus porta massa. Nullam eget vestibulum sem, a lobortis erat. Donec mattis est vitae luctus aliquet. Nullam eu molestie risus. Sed quis neque malesuada, ornare ex sit amet, egestas mauris. Donec malesuada quis diam a sagittis. Donec sodales sem orci, ac scelerisque arcu rutrum ac. Sed suscipit vitae est nec convallis. Sed auctor id lectus sit amet tempor. Mauris quis nisi eu ante consequat pharetra eget non dui. Aenean ornare luctus massa vel tempor. Praesent fringilla lobortis arcu in consectetur. Praesent eu eros pretium, lacinia ante quis, ornare purus. Quisque volutpat purus in sem euismod ornare.";
  var defaultColor = Color.fromRGBO(30, 30, 30, 30);

  NoticeView(this._img,this._title,this._date);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: defaultColor,
      ),
      backgroundColor: defaultColor,
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          color: defaultColor,
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
              _getImageNetwork(_img),
              _getBody(_title,_date, _description),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImageNetwork(url){

    return new Container(
        height: 200.0,
        child: new Image.network(
            url,
            fit: BoxFit.cover)
    );

  }

  Widget _getBody(tittle,date,description){

    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTittle(tittle),
          _getDate(_date),
          _getDescription(description),
        ],
      ),
    );
  }

  _getTittle(tittle) {
    return new Text(tittle,
      style: new TextStyle(
        color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    );
  }

  _getDate(date) {

    return new Container(
        margin: new EdgeInsets.only(top: 5.0),
        child: new Text(date,
          style: new TextStyle(
              fontSize: 10.0,
              color: Colors.grey
          ),
        )
    );
  }

  _getDescription(description) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(
        description,
        textAlign: TextAlign.justify,
        style: TextStyle(fontWeight: FontWeight.normal, color:Colors.white),
      ),
    );
  }

}