import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/models/user_model/user_model.dart';

abstract class IFavoriteService {
  final NetworkManager manager;

  IFavoriteService(this.manager);
}
