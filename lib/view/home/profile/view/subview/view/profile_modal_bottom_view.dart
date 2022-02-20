import 'package:blog_app/core/extension/context_extension.dart';
import 'package:blog_app/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base/view/base_widget.dart';
import '../../../../../_product/widgets/button/custom_app_button.dart';

class ProfileModalBottomView extends StatelessWidget {
  const ProfileModalBottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, ProfileViewModel model) => Scaffold(
        body: Column(
          children: [
            buildImage(model),
            Expanded(
              flex: 3,
              child: Padding(
                padding: context.paddingNormalHorizontal,
                child: Row(
                  children: [
                    buildSelectButton(context, model),
                    buildRemove(context, model),
                  ],
                ),
              ),
            ),
            buildOkButton(model, context),
          ],
        ),
      ),
    );
  }

  Expanded buildImage(ProfileViewModel model) => Expanded(child: model.isImageSelected ? Image.file(model.image) : Container());

  Expanded buildSelectButton(BuildContext context, ProfileViewModel model) {
    return Expanded(
                    child: Padding(
                      padding: context.paddingLow,
                      child: CustomAppButton(
                        title: "Select",
                        icon: Icons.add_a_photo,
                        isBlack: true,
                        onTap: () {
                          _showMaterialDialog(context, model);
                        },
                      ),
                    ),
                  );
  }

  Expanded buildRemove(BuildContext context, ProfileViewModel model) {
    return Expanded(
                    child: Padding(
                      padding: context.paddingLow,
                      child: CustomAppButton(
                        title: "Remove",
                        icon: Icons.remove,
                        onTap: () {
                          model.deleteImage();
                        },
                      ),
                    ),
                  );
  }

  Expanded buildOkButton(ProfileViewModel model, BuildContext context) {
    return Expanded(
              child: model.isImageSelected
                  ? Center(
                    child: Padding(
                        padding: context.paddingLow,
                        child: CustomAppButton(
                          title: "Okay",
                          icon: Icons.add_a_photo,
                          isBlack: true,
                          onTap: () {
                            Map data = {
                              "status" :"success",
                              "file": model.image,
                            };
                            Navigator.pop(context,data);
                          },
                        ),
                      ),
                  )
                  : Container());
  }

  void _showMaterialDialog(BuildContext context, ProfileViewModel model) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Select a Picture')),
            actions: <Widget>[
              Padding(
                padding: context.paddingNormalHorizontal,
                child: Column(
                  children: [
                    Padding(
                      padding: context.paddingLow,
                      child: CustomAppButton(
                        title: "Camera",
                        icon: Icons.camera_alt_sharp,
                        isBlack: true,
                        onTap: () {
                          model.getImageFromCamera(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: context.paddingLow,
                      child: CustomAppButton(
                        title: "Gallery",
                        icon: Icons.file_copy,
                        onTap: () {
                          model.getImageFromGallery(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
