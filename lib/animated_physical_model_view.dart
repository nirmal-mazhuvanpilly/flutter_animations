import 'package:flutter/material.dart';

class AnimatedPhysicalModelView extends StatefulWidget {
  const AnimatedPhysicalModelView({Key? key}) : super(key: key);

  @override
  _AnimatedPhysicalModelViewState createState() =>
      _AnimatedPhysicalModelViewState();
}

class _AnimatedPhysicalModelViewState extends State<AnimatedPhysicalModelView> {
  double _radius = 0;
  double _elevation = 0;
  Color _color = Colors.red;

  void _animateModel() {
    setState(() {
      _radius = _radius == 0 ? 100 : 0;
      _elevation = _elevation == 0 ? 10 : 0;
      _color = _color == Colors.red ? Colors.orange : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPhysicalModel(
              child: const SizedBox(height: 150, width: 150),
              borderRadius: BorderRadius.circular(_radius),
              shape: BoxShape.rectangle,
              elevation: _elevation,
              animateColor: true,
              color: _color,
              shadowColor: Colors.red.shade900,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              onEnd: _animateModel,
            ),
          ],
        ),
      ),
    );
  }
}
