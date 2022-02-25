import 'package:flutter/material.dart';

class AnimatedWidgetView extends StatefulWidget {
  const AnimatedWidgetView({Key? key}) : super(key: key);

  @override
  _AnimatedWidgetViewState createState() => _AnimatedWidgetViewState();
}

class _AnimatedWidgetViewState extends State<AnimatedWidgetView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animation = Tween<double>(begin: 0, end: 200).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      _animationController.forward();
    });

    _animationController.addStatusListener((status) {
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
        child: AnimatedwidgetChild(
          animation: _animation,
        ),
      ),
    );
  }
}

class AnimatedwidgetChild extends AnimatedWidget {
  const AnimatedwidgetChild({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Animation<double> get _size => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size.value,
      width: _size.value,
      color: Colors.red,
    );
  }
}
