import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/home/home/model/home_model.dart';

import '../model/blog_model.dart';

abstract class IHomeService {
  final NetworkManager manager;

  IHomeService(this.manager);

  Future<List<HomeModel>?> getHomeItems();
  Future<List<BlogModel>?> getBlogs(String categoryId);
  Future<void> likeBlog(String id);
}
