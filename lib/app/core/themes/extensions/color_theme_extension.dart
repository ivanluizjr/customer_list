import 'package:flutter/material.dart';

import '../colors/app_colors_theme.dart';

extension ColorThemeExtension on BuildContext {
  AppColorsTheme get appColors =>
      Theme.of(this).extension<AppColorsTheme>() ??
      AppColorsTheme.defaultTheme();
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get padding => MediaQuery.paddingOf(this);
}
