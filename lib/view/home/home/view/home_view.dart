import 'package:blog_app/core/base/view/base_widget.dart';
import 'package:blog_app/core/extension/context_extension.dart';
import 'package:blog_app/core/init/theme/color_palette.dart';
import 'package:blog_app/view/home/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';

import '../../../_product/widgets/container/home_blog_container.dart';
import '../../../_product/widgets/container/home_category_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, HomeViewModel model) => Scaffold(
        appBar: buildAppBar(),
        body: model.isLoading ? const Center(child: CircularProgressIndicator.adaptive()) :Padding(
          padding: const EdgeInsets.all(12.0),
          child: buildBody(context, model),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Home",
          style: TextStyle(color: ColorPalette.instance.textColor),
        ),
      );
  }

  ListView buildBody(BuildContext context, HomeViewModel model) {
    return ListView(
          children: [
            buildCategories(context, model),
            buildBlogs(model),
          ],
        );
  }

  SizedBox buildCategories(BuildContext context, HomeViewModel model) {
    return SizedBox(
            height: context.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.categoryItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    model.getSelectedCategories(model.categoryItems[index].id ?? "");
                  },
                  child: HomeCategoryContainer(
                    imageUrl: model.categoryItems[index].image,
                    title: model.categoryItems[index].title,
                  ),
                );
              },
            ),
          );
  }

  GridView buildBlogs(HomeViewModel model) {
    return GridView.builder(
            itemCount: model.blogItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => model.navigateBlogPage(model.blogItems[index]),
                child: HomeBlogContainer(
                  title: model.blogItems[index].title,
                  likeFunction: () => model.changeLike(model.blogItems[index]),
                  isLiked: model.blogItems[index].isLiked,
                  imageUrl: model.blogItems[index].image,
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
          );
  }
}
