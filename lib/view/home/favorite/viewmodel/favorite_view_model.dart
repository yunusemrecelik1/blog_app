import 'package:blog_app/core/base/model/base_view_model.dart';
import 'package:blog_app/service/user_service/IUserService.dart';
import 'package:blog_app/service/user_service/user_service.dart';
import 'package:blog_app/view/home/favorite/service/IFavoriteService.dart';
import 'package:blog_app/view/home/favorite/service/favorite_service.dart';
import 'package:blog_app/view/home/home/model/blog_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../home/service/IHomeService.dart';
import '../../home/service/home_service.dart';

class FavoriteViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  late IUserService userService;
  late List<String> favoriteBlogIds;
  late IHomeService homeService;
  List<BlogModel> blogItems = [];
  List<BlogModel> likedBlogItems = [];
  bool isLoading = false;
  @override
  Future<void> init() async {
    userService = UserService(NetworkManager.instance!);
    homeService = HomeService(NetworkManager.instance!);
    favoriteBlogIds = await getFavoriteBlogIds();
    getFavoriteBlogs();
  }
  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  void changeLike(BlogModel item){
    item.isLiked = !item.isLiked;
    notifyListeners();
  }
  Future<List<String>> getFavoriteBlogIds() async {
    changeLoading();
    final response = await userService.getUser();
    return response.favoriteBlogIds ?? [];
  }
  Future<void> getFavoriteBlogs() async {
    final response = await homeService.getBlogs("");
    blogItems = response ?? [];
    for(int i = 0; i<blogItems.length;i++){
      for(int j = 0; j<favoriteBlogIds.length;j++){
        if(blogItems[i].id == favoriteBlogIds[j]){
          if(!(likedBlogItems.contains(blogItems[i]))){
            likedBlogItems.add(blogItems[i]);
          }
        }
      }
    }
    changeLoading();
    notifyListeners();
  }
}
