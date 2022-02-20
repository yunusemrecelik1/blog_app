import 'package:blog_app/core/base/model/base_view_model.dart';
import 'package:blog_app/core/constants/navigation/navigation_constants.dart';
import 'package:blog_app/core/init/navigation/navigation_service.dart';
import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/home/home/model/blog_model.dart';
import 'package:blog_app/view/home/home/service/IHomeService.dart';
import 'package:blog_app/view/home/home/service/home_service.dart';
import 'package:flutter/material.dart';

import '../model/home_model.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  late IHomeService homeService;

  List<HomeModel> categoryItems = [];
  List<BlogModel> blogItems = [];

  bool isLoading = false;
  @override
  void init() {
    homeService = HomeService(NetworkManager.instance!);
    getCategories();
    getBlogs("");
  }
  Future<void> getCategories() async{
      changeLoading();
      final response = await homeService.getHomeItems();
      categoryItems = response ?? [];
      changeLoading();
      notifyListeners();
  }

  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getSelectedCategories(String categoryId) async{
    changeLoading();
    final response = await homeService.getBlogs(categoryId);
    blogItems = response ?? [];
    changeLoading();
    notifyListeners();
  }

  Future<void> getBlogs(String categoryId) async{
    changeLoading();
    final response = await homeService.getBlogs("");
    blogItems = response ?? [];
    changeLoading();
    notifyListeners();
  }
  void changeLike(BlogModel item){
    item.isLiked = !item.isLiked;
    homeService.likeBlog(item.id ?? "");
    notifyListeners();
  }

  void navigateBlogPage(BlogModel model){
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.blogDetail,
      data: model,
    );
  }

}
