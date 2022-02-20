import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_exntension.dart';
import 'ICoreDio.dart';
import 'IResponseModel.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {


  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<T extends BaseModel,R>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response = await request(path, data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data["Data"]);
        return ResponseModel<R>(data: model);
      default:
        Fluttertoast.showToast(
            msg: "Bir sorun çıktı",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return ResponseModel(error: BaseError('message'));
    }
  }
  @override
  Future<String> uploadImage(String path,File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    final response = await request(path, data: formData);
    return response.toString();
  }

  @override
  Future<String> favorite(String path, dynamic id,HttpTypes type,) async{
    final response = await request(path, data: id, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
      Fluttertoast.showToast(
          msg: "İşlem Başarılı",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
        return "Başarılı";
      default:
        return "Bir sorun çıktı";
    }
  }
}
