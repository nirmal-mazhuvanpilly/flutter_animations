import 'package:flutter/material.dart';

class AnimatedContainerView extends StatefulWidget {
  const AnimatedContainerView({Key? key}) : super(key: key);

  @override
  _AnimatedContainerViewState createState() => _AnimatedContainerViewState();
}

class _AnimatedContainerViewState extends State<AnimatedContainerView> {
  double _height = 100;
  double _width = 100;
  Color _color = Colors.red;

  void _animateContainer() {
    if (_height == 100 || _width == 100) {
      setState(() {
        _height = 200;
        _width = 200;
        _color = Colors.orange;
      });
    } else {
      setState(() {
        _height = 100;
        _width = 100;
        _color = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _animateContainer,
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          color: _color,
          height: _height,
          width: _width,
          child: const Center(
              child: Text(
            "Animated Container",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
