import 'package:blog_app/core/base/model/base_view_model.dart';
import 'package:blog_app/view/home/home/model/blog_model.dart';
import 'package:flutter/material.dart';

class BlogDetailViewModel extends ChangeNotifier with BaseViewModel {
  final BlogModel? model;

  BlogDetailViewModel(this.model);
  late BlogModel blogModel;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    blogModel = model ?? BlogModel();
  }

}