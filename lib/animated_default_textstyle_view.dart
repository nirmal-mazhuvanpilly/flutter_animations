import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleView extends StatelessWidget {
  AnimatedDefaultTextStyleView({Key? key}) : super(key: key);

  static const TextStyle _style1 = TextStyle(
    color: Colors.red,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle _style2 = TextStyle(
    color: Colors.orange,
    fontSize: 40,
  );

  //Using ValueNotifier to avoid rebuilds by using setState() method
  final ValueNotifier<bool> _isChanged = ValueNotifier<bool>(true);

  void _changeTextStyle() {
    _isChanged.value = !_isChanged.value;
    debugPrint(_isChanged.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    //To test rebuilds
    debugPrint("Rebuilding");
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: _changeTextStyle,
            child: ValueListenableBuilder<bool>(
              valueListenable: _isChanged,
              builder: (_, value, __) {
                //Animated Deafult TextStyle Implementation
                return AnimatedDefaultTextStyle(
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceOut,
                    style: value ? _style1 : _style2,
                    child: const Text("TextStyle"));
              },
            )),
      ),
    );
  }
}
