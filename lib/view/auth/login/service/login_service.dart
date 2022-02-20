import 'package:blog_app/core/constants/enums/http_request_enum.dart';
import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/_product/enum/network_route_enum.dart';
import 'package:blog_app/view/auth/login/model/login_response_model.dart';

import '../model/login_model.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService {
  LoginService(NetworkManager manager) : super(manager);

  @override
  Future<String> fetchUserControl(LoginModel model) async {
    final response = await manager.coreDio?.send<LoginResponseModel, LoginResponseModel>(
      NetworkRoutes.login.rawValue,
      type: HttpTypes.post,
      parseModel: LoginResponseModel(),
      data: model,
    );
    return response?.data?.token ?? "";
  }
}
