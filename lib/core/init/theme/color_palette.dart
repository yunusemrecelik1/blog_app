import 'package:blog_app/core/extension/string_extension.dart';

class ColorPalette {
  static ColorPalette? _instance;

  static ColorPalette get instance => _instance ??= ColorPalette._init();

  ColorPalette._init();

  final textColor = '292F3B'.colorPalette;
}