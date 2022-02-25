import 'package:flutter/material.dart';

class AnimatedSizeView extends StatefulWidget {
  const AnimatedSizeView({Key? key}) : super(key: key);

  @override
  _AnimatedSizeViewState createState() => _AnimatedSizeViewState();
}

class _AnimatedSizeViewState extends State<AnimatedSizeView> {
  double _size = 100.0;

  void _changeSize() {
    setState(() {
      _size = _size == 100 ? 250.0 : 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _changeSize,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 150),
            curve: Curves.fastOutSlowIn,
            child: FlutterLogo(
              size: _size,
            ),
          ),
        ),
      ),
    );
  }
}
