import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieView extends StatefulWidget {
  const LottieView({Key? key}) : super(key: key);

  @override
  _LottieViewState createState() => _LottieViewState();
}

class _LottieViewState extends State<LottieView> with TickerProviderStateMixin {
  late AnimationController _lottieAnimationController;

  @override
  void initState() {
    super.initState();
    _lottieAnimationController = AnimationController(vsync: this);
    _lottieAnimationController.addStatusListener((AnimationStatus status) {
      debugPrint(status.toString());
      if (status == AnimationStatus.completed) {
        _lottieAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _lottieAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    if (mounted) {
      _lottieAnimationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _lottieAnimationController.forward(),
                child: Lottie.asset(
                  'assets/loader.json',
                  controller: _lottieAnimationController,
                  onLoaded: (LottieComposition composition) {
                    _lottieAnimationController.duration =
                        const Duration(seconds: 2);
                  },
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _lottieAnimationController.forward(),
                child: Lottie.network(
                  'https://assets6.lottiefiles.com/private_files/lf30_pidikbny.json',
                  controller: _lottieAnimationController,
                  onLoaded: (LottieComposition composition) {          
                    // _lottieAnimationController.duration = composition.duration;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
