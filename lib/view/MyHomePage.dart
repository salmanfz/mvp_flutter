import 'package:flutter/material.dart';
import 'package:mvp_patern/model/MyHomePageModel.dart';
import 'package:mvp_patern/presenter/MyHomePresenter.dart';
import 'package:mvp_patern/view/view.dart';


class MyHomePage extends StatefulWidget {
  final String title;
  final AppPresenter presenter;

  MyHomePage(this.presenter, {this.title, Key key}) : super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements AppView  {

  MyHomePageModel _homePageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _homePageModel.controller1,
          ),
          TextField(
            controller: _homePageModel.controller2,
          ),
          RaisedButton(onPressed: ()=>this.widget.presenter.buttonClick(), child: Icon(Icons.add)),
          Text("Result : ${_homePageModel.result}", style: TextStyle(fontSize: 30.0),)
        ],
      ),
    );
  }

  @override
  void refreshModel(MyHomePageModel model) {
    setState(() {
      this._homePageModel=model;
    });
  }

  @override
  void initState() { 
    super.initState();
    this.widget.presenter.view=this;
  }
}