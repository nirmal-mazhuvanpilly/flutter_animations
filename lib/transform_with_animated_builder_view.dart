import 'dart:math';

import 'package:flutter/material.dart';

class TansformAnimatedBuilderView extends StatefulWidget {
  const TansformAnimatedBuilderView({Key? key}) : super(key: key);

  @override
  _TansformAnimatedBuilderViewState createState() =>
      _TansformAnimatedBuilderViewState();
}

class _TansformAnimatedBuilderViewState
    extends State<TansformAnimatedBuilderView> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 360).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedBuilder(
        child: const Center(
          child: Text("Transform"),
        ),
        animation: _animationController,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_animation.value / 180 * pi),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              child: child,
            ),
          );
        },
      )),
    );
  }
}
