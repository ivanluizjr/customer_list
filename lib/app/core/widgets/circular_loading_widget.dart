import 'dart:math';

import 'package:flutter/material.dart';

class RenderCircularLoading extends RenderBox {
  late AnimationController _controller;
  double _currentValue = 0.0;

  final Paint _backPaint;
  final Paint _frontPaint;
  final double _size;

  static const double _twoPi = 2 * pi;
  static const double _loadingArcAngle = pi / 4;

  RenderCircularLoading({
    required AnimationController controller,
    required Color backgroundColor,
    required Color loadingColor,
    required double strokeWidth,
    required double size,
  }) : _backPaint = Paint()
         ..color = backgroundColor
         ..strokeWidth = strokeWidth
         ..style = PaintingStyle.stroke,
       _frontPaint = Paint()
         ..color = loadingColor
         ..strokeWidth = strokeWidth
         ..strokeCap = StrokeCap.round
         ..style = PaintingStyle.stroke,
       _size = size {
    _controller = controller;
    _controller.addListener(_handleAnimationUpdate);
  }

  void _handleAnimationUpdate() {
    _currentValue = _controller.value;
    markNeedsPaint();
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    // Usa o tamanho fixo ao invés de constraints.maxWidth
    return Size.square(_size);
  }

  @override
  bool get sizedByParent => true;

  @override
  void performLayout() {}

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.translate(offset.dx, offset.dy);

    final adjustedRadius = (_size - _frontPaint.strokeWidth) / 2;
    final center = Offset(_size / 2, _size / 2);

    final rect = Rect.fromCenter(
      center: center,
      width: adjustedRadius * 2,
      height: adjustedRadius * 2,
    );

    canvas.drawArc(rect, pi, _twoPi, false, _backPaint);
    canvas.drawArc(
      rect,
      _currentValue * _twoPi,
      _loadingArcAngle,
      false,
      _frontPaint,
    );

    canvas.translate(-offset.dx, -offset.dy);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleAnimationUpdate);
    super.dispose();
  }
}

class CircularLoading extends LeafRenderObjectWidget {
  final AnimationController controller;
  final Color backgroundColor;
  final Color loadingColor;
  final double strokeWidth;
  final double size; // Adiciona tamanho

  const CircularLoading({
    super.key,
    required this.controller,
    required this.backgroundColor,
    required this.loadingColor,
    required this.strokeWidth,
    required this.size, // Requer o tamanho
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCircularLoading(
      controller: controller,
      backgroundColor: backgroundColor,
      loadingColor: loadingColor,
      strokeWidth: strokeWidth,
      size: size,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderCircularLoading renderObject,
  ) {
    renderObject._controller = controller;
  }
}

class CircularLoadingWidget extends StatefulWidget {
  final double size;
  final Duration duration;
  final Color backgroundColor;
  final Color loadingColor;
  final double strokeWidth;

  const CircularLoadingWidget({
    super.key,
    this.size = 110,
    this.duration = const Duration(milliseconds: 1000),
    this.backgroundColor = const Color(0xFFF6F6F6),
    this.loadingColor = const Color(0xFFF9E5D1),
    this.strokeWidth = 18,
  });

  @override
  State<CircularLoadingWidget> createState() => _CircularLoadingWidgetState();
}

class _CircularLoadingWidgetState extends State<CircularLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CircularLoading(
        controller: _controller,
        backgroundColor: widget.backgroundColor,
        loadingColor: widget.loadingColor,
        strokeWidth: widget.strokeWidth,
        size: widget.size, // Passa o tamanho
      ),
    );
  }
}
