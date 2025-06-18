import 'package:customer_list/app/core/themes/extensions/color_theme_extension.dart';
import 'package:customer_list/app/core/widgets/circular_loading_widget.dart';
import 'package:customer_list/app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Size? size;
  final bool isOutlined;
  final bool isLoading;

  const ButtonWidget._({
    this.onPressed,
    required this.title,
    this.size = const Size(106, 36),
    this.isOutlined = false,
    this.isLoading = false,
  });

  factory ButtonWidget.small({
    VoidCallback? onPressed,
    required String title,
    bool isLoading = false,
  }) {
    return ButtonWidget._(
      title: title,
      isLoading: isLoading,
      onPressed: onPressed,
    );
  }

  factory ButtonWidget.medium({
    VoidCallback? onPressed,
    required String title,
    bool isLoading = false,
  }) {
    return ButtonWidget._(
      title: title,
      onPressed: onPressed,
      size: const Size(110, 40),
      isLoading: isLoading,
    );
  }

  factory ButtonWidget.large({
    VoidCallback? onPressed,
    required String title,
    bool isLoading = false,
  }) {
    return ButtonWidget._(
      title: title,
      isLoading: isLoading,
      size: const Size(125, 44),
      onPressed: onPressed,
    );
  }

  factory ButtonWidget.extraLarge({
    VoidCallback? onPressed,
    required String title,
    bool isLoading = false,
  }) {
    return ButtonWidget._(
      title: title,
      size: const Size(129, 48),
      isLoading: isLoading,
      onPressed: onPressed,
    );
  }

  factory ButtonWidget.extraLargeWithWidthFlexible({
    VoidCallback? onPressed,
    required String title,
    double width = double.infinity,
    bool isLoading = false,
  }) {
    return ButtonWidget._(
      title: title,
      size: Size(width, 48),
      onPressed: onPressed,
      isLoading: isLoading,
    );
  }

  factory ButtonWidget.extraLargeWithWidthFlexibleOutlined({
    VoidCallback? onPressed,
    required String title,
    double width = double.infinity,
  }) {
    return ButtonWidget._(
      title: title,
      size: Size(width, 48),
      onPressed: onPressed,
      isOutlined: true,
    );
  }

  factory ButtonWidget.extraLarge2({
    VoidCallback? onPressed,
    required String title,
  }) {
    return ButtonWidget._(
      title: title,
      size: const Size(156, 60),
      onPressed: onPressed,
    );
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStateProperty.resolveWith(
          (state) => isOutlined
              ? Colors.transparent
              : state.contains(WidgetState.disabled)
              ? context.appColors.greyNeutral
              : context.appColors.lightGreen,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isOutlined
                ? BorderSide(color: context.appColors.brown)
                : BorderSide.none,
          ),
        ),
        minimumSize: WidgetStatePropertyAll(size),
      ),
      child: isLoading
          ? CircularLoadingWidget(strokeWidth: 8, size: (size?.height ?? 0) - 4)
          : TextWidget(
              text: title,
              colorText: isOutlined
                  ? context.appColors.greyNeutral
                  : context.appColors.brown,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
    );
  }
}
