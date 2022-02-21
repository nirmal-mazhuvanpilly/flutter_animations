import 'package:flutter/material.dart';

class AnimatedCrossFadeView extends StatefulWidget {
  const AnimatedCrossFadeView({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeViewState createState() => _AnimatedCrossFadeViewState();
}

const _image = "https://wallpaperaccess.com/full/2713203.jpg";

class _AnimatedCrossFadeViewState extends State<AnimatedCrossFadeView> {
  bool _isFirst = true;

  void _changeChilds() {
    setState(() {
      _isFirst = !_isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //AnimatedCrossFade Implementation
          AnimatedCrossFade(
            alignment: Alignment.center,
            firstChild: const FirstChild(),
            secondChild: const SecondChild(),
            sizeCurve: Curves.fastOutSlowIn,
            crossFadeState:
                _isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 500),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: _changeChilds,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text(
                    _isFirst ? "Night" : "Day",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))),
        ],
      ),
    );
  }
}

class FirstChild extends StatelessWidget {
  const FirstChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        _image,
        fit: BoxFit.cover,
        color: Colors.indigo,
        colorBlendMode: BlendMode.color,
      ),
    );
  }
}

class SecondChild extends StatelessWidget {
  const SecondChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        _image,
        fit: BoxFit.cover,
        color: Colors.orange,
        colorBlendMode: BlendMode.multiply,
      ),
    );
  }
}
