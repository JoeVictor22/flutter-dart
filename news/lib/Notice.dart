import 'dart:ui';

import 'package:flutter/material.dart';

class Notice extends StatelessWidget{

  var _img;
  var _title;

  Notice(this._img,this._title);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return new Container(
      margin: const EdgeInsets.only(left: 1.0, right: 1.0,bottom: 1.0,top: 0.0),
      child: new Material(
        textStyle: TextStyle(color: Colors.white),
        borderRadius: new BorderRadius.circular(5.0),
        elevation: 8.0,
        child: _getListTile(),
      ),
    );
  }

  Widget _getListTile(){


    return new Container(
      height: 90.0,
      color: Color.fromRGBO(40, 40, 40, 1),

      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new FadeInImage.assetNetwork(placeholder: '', image: _img,fit: BoxFit.cover,width: 70.0,height: 70.0,),
          _getColumText(_title),
        ],

      ),
    );

  }

  Widget _getColumText(tittle){

    return new Expanded(
        child: new Container(
          margin: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              _getTitleWidget(_title)]
          ),
        )
    );
  }

  Widget _getTitleWidget(String curencyName){
    return new Text(
      curencyName,
      maxLines: 3,
      style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
    );
  }



}