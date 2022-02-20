import 'package:blog_app/core/base/view/base_widget.dart';
import 'package:blog_app/view/home/favorite/viewmodel/favorite_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/theme/color_palette.dart';
import '../../../_product/widgets/container/home_blog_container.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoriteViewModel>(
      viewModel: FavoriteViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, FavoriteViewModel value) => Scaffold(
        appBar: buildAppBar(),
        body: value.isLoading ? const CircularProgressIndicator.adaptive() :  buildBody(value),
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
          "My Favorites",
          style: TextStyle(color: ColorPalette.instance.textColor),
        ),
      );
  }

  Padding buildBody(FavoriteViewModel value) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: value.likedBlogItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              //onTap: () => model.navigateBlogPage(model.blogItems[index]),
              child: HomeBlogContainer(
                title: value.likedBlogItems[index].title,
                likeFunction: () => value.changeLike(value.likedBlogItems[index]),
                isLiked: true,
                imageUrl: value.likedBlogItems[index].image,
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
        ),
      );
  }
}
