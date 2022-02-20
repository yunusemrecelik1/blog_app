import 'package:blog_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
  int pageIndex = 0;
  void changeIndex(int index){
    pageIndex = index;
    notifyListeners();
  }
}