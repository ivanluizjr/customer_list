import 'package:customer_list/app/core/%20routes/routes.dart';
import 'package:customer_list/app/core/themes/extensions/color_theme_extension.dart';
import 'package:customer_list/app/core/widgets/circular_loading_widget.dart';
import 'package:customer_list/app/core/widgets/image_assets_widget.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoPositionAnimation;
  late Animation<double> _logoScalePositionAnimation;
  late Animation<double> _logoScaleAnimation;
  // ignore: unused_field
  late Animation<double> _firstTextOpacityAnimation;
  // ignore: unused_field
  late Animation<double> _secondTextOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _firstTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
      ),
    );

    _secondTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    primaryFocus?.unfocus();
    _initializeAnimations();

    initialize();
  }

  void _initializeAnimations() {
    final size = MediaQuery.of(context).size;

    _logoPositionAnimation =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: size.height * 0.25,
              end: size.height * 0.123,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 10.0,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: size.height * 0.25,
              end: size.height * 0.123,
            ).chain(CurveTween(curve: Curves.bounceOut)),
            weight: 80.0,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: size.height * 0.123,
              end: 0,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 10.0,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 1)),
        );

    _logoScaleAnimation =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.21052631579,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 50.0,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(.9, 1)),
        );
    _logoScalePositionAnimation =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.decelerate)),
            weight: 100.0,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0, .2)),
        );

    _controller.forward();
  }

  Future<void> initialize() async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 4));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, Routes.homePage);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ImageAssetsWidget.splashBackground(
            width: context.screenSize.width,
            height: context.screenSize.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: context.padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _logoScaleAnimation.value,
                        child: Transform.translate(
                          offset: Offset(0, _logoPositionAnimation.value),
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: context.screenSize.height * 30 / 812,
                              top: context.screenSize.height * 30 / 812,
                            ),
                            child: Transform.scale(
                              scale: _logoScalePositionAnimation.value,
                              child: ImageAssetsWidget.brasaoSplash(
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  Spacer(flex: 3),

                  Padding(
                    padding: EdgeInsets.only(
                      bottom: context.screenSize.height * 24 / 812,
                      top: context.screenSize.height * 24 / 812,
                    ),
                    child: CircularLoadingWidget(
                      size: 47,
                      strokeWidth: 8,
                      backgroundColor: context.appColors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
