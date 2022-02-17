import 'package:flutter/material.dart';

class AnimatedAlignView extends StatefulWidget {
  const AnimatedAlignView({Key? key}) : super(key: key);

  @override
  _AnimatedAlignViewState createState() => _AnimatedAlignViewState();
}

class _AnimatedAlignViewState extends State<AnimatedAlignView> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 40,
          width: 80,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF004D40), Color(0xFF009688)]),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              //Animated Align Example
              AnimatedAlign(
                duration: const Duration(milliseconds: 100),
                alignment:
                    _selected ? Alignment.centerRight : Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selected = !_selected;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Color(0xeeededeb)],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
