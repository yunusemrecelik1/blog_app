import 'dart:io';

import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'IResponseModel.dart';


abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<T extends BaseModel,R>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress});
  Future<String> uploadImage(String path,File file);
  Future<String> favorite(String path,dynamic data ,HttpTypes type);
}


