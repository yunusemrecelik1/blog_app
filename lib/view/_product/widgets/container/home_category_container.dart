import 'package:blog_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/theme/color_palette.dart';
class HomeCategoryContainer extends StatelessWidget {
  const HomeCategoryContainer({Key? key,required this.title,required this.imageUrl}) : super(key: key);

  final String? title;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          Container(
            height: context.height * 0.1,
            width: context.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorPalette.instance.textColor),
              image: DecorationImage(
                image: NetworkImage(imageUrl ?? "https://picsum.photos/200/300"),
              ),
            ),
          ),
          Text(title ?? "",textAlign: TextAlign.start),
        ],
      ),
    );
  }
}
