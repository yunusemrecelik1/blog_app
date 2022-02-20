import 'package:blog_app/core/base/view/base_widget.dart';
import 'package:blog_app/core/extension/context_extension.dart';
import 'package:blog_app/view/home/favorite/view/favorite_view.dart';
import 'package:blog_app/view/home/home/view/home_view.dart';
import 'package:flutter/material.dart';

import '../../profile/view/profile_view.dart';
import '../viewmodel/bottom_navigation_bar_view_model.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationBarViewModel>(
      viewModel: BottomNavigationBarViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, BottomNavigationBarViewModel model) => Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            bottomNavigationBar: buildBottomNavigationBar(context, model),
            body: [const FavoriteView(),const HomeView(),const ProfileView()][model.pageIndex],
            ),
          ),
        ),
    );
  }

  Padding buildBottomNavigationBar(BuildContext context, BottomNavigationBarViewModel value) {
    return Padding(
      padding: context.paddingLowBottom,
      child: FittedBox(
        child: Container(
          width: context.width,
          padding: context.paddingMediumHorizontal + context.paddingNormalHorizontal,
          decoration: buildBoxDecoration(context),
          child: buildElements(value, context),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF919191).withOpacity(0.22),
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        );
  }

  Row buildElements(BottomNavigationBarViewModel value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildIcon(value: value, icon: Icons.favorite, pageIndex: 0, context: context),
        buildIcon(value: value, icon: Icons.home, pageIndex: 1, context: context),
        buildIcon(value: value, icon: Icons.person, pageIndex: 2, context: context),
      ],
    );
  }

  Widget buildIcon({required BottomNavigationBarViewModel value, required int pageIndex, required IconData icon, required BuildContext context}) {
    return InkWell(
          onTap: () {
            value.changeIndex(pageIndex);
          },
          child: Column(
            children: [
              const SizedBox(height: 15),
              Icon(
                icon,
                color: value.pageIndex == pageIndex ? Colors.black : Colors.grey,
                size: 30,
              ),
              const SizedBox(height: 10),
            ],
          ));
  }
}
