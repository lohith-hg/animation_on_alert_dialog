import 'dart:async';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetResizeAnimation extends StatefulWidget {
  Widget widget;
  double beginScale;
  double endScale;
  int duration;
  int delayTime;
  WidgetResizeAnimation(
      {Key? key,
      required this.widget,
      required this.beginScale,
      required this.endScale,
      required this.duration,
      required this.delayTime})
      : super(key: key);

  @override
  State<WidgetResizeAnimation> createState() => _WidgetResizeAnimationState();
}

class _WidgetResizeAnimationState extends State<WidgetResizeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration:  Duration(milliseconds: widget.duration));
    Timer(Duration(milliseconds: widget.delayTime), () {
      _animController.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: widget.beginScale, end: widget.endScale).animate(
        CurvedAnimation(
          parent: _animController,
          curve: Curves.easeIn,
        ),
      ),
      child: widget.widget,
    );
  }
}
