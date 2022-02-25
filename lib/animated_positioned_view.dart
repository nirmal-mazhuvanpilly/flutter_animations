import 'package:flutter/material.dart';

class AnimatedPositionedView extends StatefulWidget {
  const AnimatedPositionedView({Key? key}) : super(key: key);

  @override
  _AnimatedPositionedViewState createState() => _AnimatedPositionedViewState();
}

class _AnimatedPositionedViewState extends State<AnimatedPositionedView> {
  bool _isTapped = false;

  void _changePosition() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            top: _isTapped ? 0 : _size.height / 2 - 100,
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
                onTap: _changePosition,
                child: Container(color: Colors.red, height: 100, width: 100)),
            duration: const Duration(milliseconds: 150),
          ),
        ],
      )),
    );
  }
}
