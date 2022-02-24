import 'package:flutter/material.dart';

class AnimatedOpacityView extends StatefulWidget {
  const AnimatedOpacityView({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityView> createState() => _AnimatedOpacityViewState();
}

class _AnimatedOpacityViewState extends State<AnimatedOpacityView> {
  double _opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _opacityLevel,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 500),
              child: Container(color: Colors.red, height: 150, width: 150),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Change Opacity'),
              onPressed: _changeOpacity,
            ),
          ],
        ),
      ),
    );
  }
}
