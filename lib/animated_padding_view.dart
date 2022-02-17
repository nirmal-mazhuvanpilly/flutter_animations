import 'package:flutter/material.dart';

class AnimatedPaddingView extends StatefulWidget {
  const AnimatedPaddingView({Key? key}) : super(key: key);

  @override
  _AnimatedPaddingViewState createState() => _AnimatedPaddingViewState();
}

class _AnimatedPaddingViewState extends State<AnimatedPaddingView> {
  double _vertical = 0;
  double _horizontal = 0;

  void _changePadding() {
    if (_vertical == 0 || _horizontal == 0) {
      setState(() {
        _vertical = 20;
        _horizontal = 20;
      });
    } else {
      setState(() {
        _vertical = 0;
        _horizontal = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            5,
            (index) => AnimatedPadding(
                  padding: EdgeInsets.symmetric(
                      vertical: _vertical, horizontal: _horizontal),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                    onDoubleTap: _changePadding,
                    child: Container(
                      height: 50,
                      color: Colors.red,
                    ),
                  ),
                )),
      ),
    );
  }
}
