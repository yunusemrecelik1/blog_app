import 'package:blog_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/theme/color_palette.dart';

class HomeBlogContainer extends StatelessWidget {
  const HomeBlogContainer({Key? key,required this.imageUrl,required this.title, this.isLiked = false,required this.likeFunction}) : super(key: key);

  final String? imageUrl;
  final String? title;
  final bool isLiked;
  final Function()? likeFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: context.height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.height * 0.03),
                  border: Border.all(color: ColorPalette.instance.textColor),
                  image: DecorationImage(image: NetworkImage(imageUrl ?? "https://picsum.photos/200/300"), fit: BoxFit.contain),
                ),
              ),
              IconButton(
                padding: context.paddingLow,
                icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border), onPressed: likeFunction,
              ),
            ],
          ),
          Padding(
            padding: context.paddingLow,
            child: Container(
              height: context.height * 0.06,
              width: context.width,
              color: Colors.white.withOpacity(0.7),
              child: Center(child: Text(title ?? "")),
            ),
          ),
        ],
      ),
    );
  }
}
