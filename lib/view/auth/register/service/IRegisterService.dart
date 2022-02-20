import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/auth/login/model/login_response_model.dart';
import 'package:blog_app/view/auth/register/model/register_model.dart';

abstract class IRegisterService {
  final NetworkManager manager;

  IRegisterService(this.manager);

  Future<String?> fetchUserControl(RegisterModel model);
}
