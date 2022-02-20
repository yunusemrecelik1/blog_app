import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/models/user_model/user_model.dart';

import '../../../../core/constants/enums/http_request_enum.dart';
import '../../view/_product/enum/network_route_enum.dart';
import 'IUserService.dart';

class UserService extends IUserService {
  UserService(NetworkManager manager) : super(manager);

  @override
  Future<UserModel> getUser() async {
    final response = await manager.coreDio?.send<UserModel,UserModel>(
      NetworkRoutes.getUser.rawValue,
      type: HttpTypes.get,
      parseModel: UserModel(),
    );
    return response?.data ?? UserModel() ;
  }
}
