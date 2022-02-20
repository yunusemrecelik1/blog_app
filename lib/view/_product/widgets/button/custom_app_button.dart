import 'package:blog_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/theme/color_palette.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({Key? key,required this.title,required this.icon, this.onTap,this.isBlack = false}) : super(key: key);

  final String title;
  final IconData icon;
  final Function()? onTap;
  final bool isBlack;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.lowValue),
          border: isBlack ? null : Border.all(color: ColorPalette.instance.textColor),
          color: isBlack ? ColorPalette.instance.textColor : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Icon(icon,color: isBlack ? Colors.white : Colors.black,),
              Text(title,style: TextStyle(color: isBlack ? Colors.white : Colors.black),),
              const Icon(Icons.login,color: Colors.transparent,)
            ],
          ),
        ),
      ),
    );
  }
}
