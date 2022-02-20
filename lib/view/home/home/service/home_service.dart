import 'package:blog_app/core/constants/enums/http_request_enum.dart';
import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/_product/enum/network_route_enum.dart';
import 'package:blog_app/view/home/home/model/blog_model.dart';
import 'package:blog_app/view/home/home/model/home_model.dart';

import 'IHomeService.dart';

class HomeService extends IHomeService {
  HomeService(NetworkManager manager) : super(manager);

  @override
  Future<List<HomeModel>?> getHomeItems() async {
    final response = await manager.coreDio?.send<HomeModel, List<HomeModel>>(
      NetworkRoutes.categories.rawValue,
      type: HttpTypes.get,
      parseModel: HomeModel(),
    );
    return response?.data ?? [];
  }

  @override
  Future<List<BlogModel>?> getBlogs(String categoryId) async {
    final response =
        await manager.coreDio?.send<BlogModel, List<BlogModel>>(NetworkRoutes.blog.rawValue, type: HttpTypes.post, parseModel: BlogModel(), data: {
      "CategoryId": categoryId,
    });
    return response?.data ?? [];
  }

  @override
  Future<void> likeBlog(String id) async {
    if(id != ""){
      await manager.coreDio?.favorite(
        NetworkRoutes.favorite.rawValue,
        {"Id":id},
        HttpTypes.post,
      );
    }
  }
}
