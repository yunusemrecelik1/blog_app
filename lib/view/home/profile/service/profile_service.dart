import 'dart:io';
import 'package:blog_app/core/init/network/network_manager.dart';
import 'package:blog_app/view/home/profile/service/IProfileService.dart';

class ProfileService extends IProfileService {
  ProfileService(NetworkManager manager) : super(manager);

  @override
  Future<void> fetchImage(File file) async{
    final response = await manager.coreDio?.uploadImage("General/UploadImage", file);
  }

}