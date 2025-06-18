import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer_list/app/core/themes/extensions/color_theme_extension.dart';
import 'package:customer_list/app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageAssetsWidget extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isNetwork;
  final String? labelText;
  final double labelSpacing;

  String get fullPath => isNetwork ? path : 'assets/images/$path';

  const ImageAssetsWidget._({
    super.key,
    required this.path,
    this.color,
    this.width,
    this.height,
    this.fit,
    this.isNetwork = false,
    this.labelText,
    this.labelSpacing = 4.0,
  });

  factory ImageAssetsWidget.network({
    Key? key,
    required final String url,
    final Color? color,
    final double? width,
    final double? height,
    final BoxFit? fit,
    final String? labelText,
    final double labelSpacing = 4.0,
  }) {
    return ImageAssetsWidget._(
      key: key,
      path: url,
      color: color,
      width: width,
      height: height,
      fit: fit,
      isNetwork: true,
      labelText: labelText,
      labelSpacing: labelSpacing,
    );
  }

  factory ImageAssetsWidget.imageHome({
    Key? key,
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
    final String? labelText,
    final double labelSpacing = 4.0,
  }) {
    return ImageAssetsWidget._(
      key: key,
      path: 'image_home.png',
      color: color,
      width: width,
      height: height,
      fit: fit,
      labelText: labelText,
      labelSpacing: labelSpacing,
    );
  }

  factory ImageAssetsWidget.splashBackground({
    Key? key,
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
    final String? labelText,
    final double labelSpacing = 4.0,
  }) {
    return ImageAssetsWidget._(
      key: key,
      path: 'splash_background.png',
      color: color,
      width: width,
      height: height,
      fit: fit,
      labelText: labelText,
      labelSpacing: labelSpacing,
    );
  }

  factory ImageAssetsWidget.brasaoSplash({
    Key? key,
    Color? color,
    double? width,
    double? height,
    BoxFit? fit,
    final String? labelText,
    final double labelSpacing = 4.0,
  }) {
    return ImageAssetsWidget._(
      key: key,
      path: 'brasao_splash.png',
      color: color,
      width: width,
      height: height,
      fit: fit,
      labelText: labelText,
      labelSpacing: labelSpacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (path.contains('.svg')) {
      imageWidget = isNetwork
          ? SvgPicture.network(
              path,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              placeholderBuilder: (context) => const SizedBox.shrink(),
            )
          : SvgPicture.asset(
              fullPath,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
            );
    } else {
      imageWidget = isNetwork
          ? CachedNetworkImage(
              imageUrl: path,
              color: color,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              errorWidget: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
              placeholder: (context, url) => const SizedBox.shrink(),
            )
          : Image.asset(
              fullPath,
              color: color,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            );
    }

    if (labelText == null || labelText!.isEmpty) {
      return imageWidget;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imageWidget,
        SizedBox(height: labelSpacing),
        TextWidget(text: labelText ?? '', colorText: context.appColors.white),
      ],
    );
  }
}
