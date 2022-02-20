import 'package:blog_app/core/base/view/base_widget.dart';
import 'package:blog_app/core/extension/context_extension.dart';
import 'package:blog_app/view/home/blog_detail/viewmodel/blog_view_model.dart';
import 'package:blog_app/view/home/home/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../core/init/theme/color_palette.dart';

class BlogDetailView extends StatelessWidget {
  const BlogDetailView({Key? key, this.model}) : super(key: key);
  final Object? model;
  @override
  Widget build(BuildContext context) {

    return BaseView<BlogDetailViewModel>(
      viewModel: BlogDetailViewModel(model as BlogModel),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, BlogDetailViewModel value) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Blog Detail",
            style: TextStyle(color: ColorPalette.instance.textColor),
          ),
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              Text(value.blogModel.title ?? "",style: context.textTheme.titleSmall,),
              Html(
                data: value.blogModel.content,
              ),
              buildImage(context, value),
            ],
          ),
        ),
      ),
    );
  }

  Container buildImage(BuildContext context, BlogDetailViewModel value) {
    return Container(
              height: context.height * 0.1,
              width: context.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorPalette.instance.textColor),
                image: DecorationImage(
                  image: NetworkImage(value.blogModel.image ?? "https://picsum.photos/200/300"),
                ),
              ),
            );
  }
}
