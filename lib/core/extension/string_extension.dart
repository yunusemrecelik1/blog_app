import 'package:flutter/material.dart';

import '../constants/app/application_constants.dart';

extension ColorPaletteExtension on String {
  int? get colorCode => int.tryParse('0xFF$this');
  Color get colorPalette => Color(colorCode ?? 0xFFFFFFFF);
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(ApplicationConstants.emailRegex).hasMatch(this);
  }
}