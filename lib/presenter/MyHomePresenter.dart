import 'package:flutter/material.dart';
import 'package:mvp_patern/model/MyHomePageModel.dart';
import 'package:mvp_patern/view/view.dart';

class AppPresenter {
  set view(AppView value){}
  void buttonClick(){}
}

class BasicAppPresenter implements AppPresenter {
  MyHomePageModel _myHomePageModel;
  AppView _view;

  BasicAppPresenter(){
    this._myHomePageModel=MyHomePageModel();
  }

  @override
  void set view(AppView value) {
    _view=value;
    this._view.refreshModel(this._myHomePageModel);
  }

  @override
  void buttonClick() {
    int v1 = int.parse(this._myHomePageModel.controller1.text);
    int v2 = int.parse(this._myHomePageModel.controller2.text);
    this._myHomePageModel.result=v1+v2;

    this._view.refreshModel(this._myHomePageModel);
  }
  
}