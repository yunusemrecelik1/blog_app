import 'package:blog_app/core/init/network/network_manager.dart';

import '../model/login_model.dart';
import '../model/login_response_model.dart';

abstract class ILoginService {
  final NetworkManager manager;

  ILoginService(this.manager);

  Future<String?> fetchUserControl(LoginModel model);
}
