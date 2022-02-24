import 'package:flutter/material.dart';

class AnimatedBuilderView extends StatefulWidget {
  const AnimatedBuilderView({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderViewState createState() => _AnimatedBuilderViewState();
}

class _AnimatedBuilderViewState extends State<AnimatedBuilderView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimaion;
  late Animation<double> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 500));
    _sizeAnimation = Tween<double>(begin: 50, end: 100).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _colorAnimaion = ColorTween(begin: Colors.red, end: Colors.orange).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _borderRadiusAnimation = Tween<double>(begin: 0, end: 100).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _animationController.forward();

    _animationController.addStatusListener((status) {
      debugPrint(status.toString());
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
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
          animation: _animationController,
          builder: (context, child) {
            return Container(
              height: _sizeAnimation.value,
              width: _sizeAnimation.value,
              decoration: BoxDecoration(
                  color: _colorAnimaion.value,
                  borderRadius:
                      BorderRadius.circular(_borderRadiusAnimation.value)),
            );
          },
        ),
      ),
    );
  }
}
