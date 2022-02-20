import 'package:blog_app/core/extension/context_extension.dart';
import 'package:blog_app/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/theme/color_palette.dart';
import '../../../_product/widgets/button/custom_app_button.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, ProfileViewModel model) => Scaffold(
        appBar: buildAppBar(),
        body:
        buildBody(context, model),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: ColorPalette.instance.textColor),
        ),
      );
  }

  Padding buildBody(BuildContext context, ProfileViewModel model) {
    return Padding(
        padding: context.paddingNormal + context.paddingMediumTop,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(model, context),
            const SizedBox(height: 10),
            buildMap(context, model),
            Expanded(
              child: Padding(
                padding: context.paddingNormalHorizontal,
                child: Row(
                  children: [
                    buildSaveButton(context, model),
                    buildLogoutButton(context, model),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  InkWell buildImage(ProfileViewModel model, BuildContext context) {
    return InkWell(
              onTap: () {
                model.showModalBottom(context);
              },
              child: Center(
                child: CircleAvatar(
                  backgroundColor: model.isImageSelected ? Colors.white :Colors.grey,
                  backgroundImage: model.isNetworkImage ? NetworkImage(model.imageUrl) : model.isImageSelected ? Image.file(model.image,fit: BoxFit.cover).image : null,
                  radius: context.width * 0.2,
                  child: Align(
                    alignment: const Alignment(0.6, 0.6),
                    child: Icon(Icons.camera_alt_sharp,color: Colors.black,size: context.width * 0.08),
                  ),
                ),
              ),
            );
  }

  SizedBox buildMap(BuildContext context, ProfileViewModel model) {
    return SizedBox(
              height: 150,
              width: context.width,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: model.cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  model.controller.complete(controller);
                },
              ),
            );
  }

  Expanded buildSaveButton(BuildContext context, ProfileViewModel model) {
    return Expanded(
                      child: Padding(
                        padding: context.paddingLow,
                        child: CustomAppButton(
                          title: "Save",
                          icon: Icons.save_alt,
                          isBlack: false,
                          onTap: () {
                            model.fetchImage();
                          },
                        ),
                      ),
                    );
  }

  Expanded buildLogoutButton(BuildContext context, ProfileViewModel model) {
    return Expanded(
                      child: Padding(
                        padding: context.paddingLow,
                        child: CustomAppButton(
                          title: "Logout",
                          icon: Icons.logout,
                          onTap: () {
                            model.logout();
                          },
                          isBlack: true,
                        ),
                      ),
                    );
  }
}