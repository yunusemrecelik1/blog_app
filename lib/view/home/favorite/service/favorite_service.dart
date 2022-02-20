import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/models/user_model/user_model.dart';

import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../_product/enum/network_route_enum.dart';
import 'IFavoriteService.dart';

class FavoriteService extends IFavoriteService {
  FavoriteService(NetworkManager manager) : super(manager);

}
