import 'dart:io';

import 'package:blog_app/core/init/network/network_manager.dart';


abstract class IProfileService {
  final NetworkManager manager;

  IProfileService(this.manager);
  Future<void> fetchImage(File file);
}
