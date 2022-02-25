import 'dart:math';

import 'package:flutter/material.dart';

class TansformAnimationsView extends StatefulWidget {
  const TansformAnimationsView({Key? key}) : super(key: key);

  @override
  _TansformAnimationsViewState createState() => _TansformAnimationsViewState();
}

class _TansformAnimationsViewState extends State<TansformAnimationsView> {
  final String title = "Transform Widgets";

  double sliderValue = 0.0;

  Offset xOffsetValue = Offset.zero;

  Offset yOffsetValue = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            min: 0,
            max: 180,
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
                xOffsetValue = Offset(value, 0);
                yOffsetValue = Offset(0, value);
                // print(sliderValue / 180 * pi);
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 50),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(sliderValue / 180 * pi)
                    // ..rotateY(sliderValue / 180 * pi)
                    // ..rotateZ(sliderValue / 180 * pi)
                    ,
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.indigoAccent]),
                      ),
                      child: const Center(
                          child: Text("Flip",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Transform.rotate(
                    angle: (sliderValue / 180 * pi),
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.indigo, Colors.indigoAccent])),
                      child: const Center(
                          child: Text("Rotate",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Transform.scale(
                    scale: (sliderValue / 180),
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.indigo, Colors.indigoAccent])),
                      child: const Center(
                          child: Text("Scale",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: xOffsetValue,
                        child: Container(
                          height: 75,
                          width: 75,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.indigo,
                            Colors.indigoAccent
                          ])),
                          child: const Center(
                              child: Text("Trasnlate",
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      Transform.translate(
                        offset: yOffsetValue,
                        child: Container(
                          height: 75,
                          width: 75,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.indigo,
                            Colors.indigoAccent
                          ])),
                          child: const Center(
                              child: Text("Trasnlate",
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
