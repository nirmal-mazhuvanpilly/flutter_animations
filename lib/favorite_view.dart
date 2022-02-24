import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _colorController;

  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = false;
    _sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 75));
    _sizeAnimation = Tween<double>(begin: 1, end: 1.5)
        .animate(CurvedAnimation(parent: _sizeController, curve: Curves.easeIn))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _sizeController.reverse();
        }
      });
    _colorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 75));
    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_colorController);
  }

  @override
  void dispose() {
    super.dispose();
    _sizeController.dispose();
    _colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _sizeController.forward();
            if (isFavorite) {
              _colorController.reverse();
            } else {
              _colorController.forward();
            }
            isFavorite = !isFavorite;
          },
          child: AnimatedBuilder(
            animation: _sizeController,
            builder: (context, child) => Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: 50 * _sizeAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}
