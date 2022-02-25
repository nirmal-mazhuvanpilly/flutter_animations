import 'package:flutter/material.dart';

class TransitionView extends StatelessWidget {
  const TransitionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transitions"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(fadeRoute(
                        child: const TransitionChildView(
                            transition: "Fade Transition")));
                  },
                  child: const Text("Fade Transition")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(positionedRoute(
                        context: context,
                        child: const TransitionChildView(
                            transition: "Positioned Transition")));
                  },
                  child: const Text("Positioned Transition")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(rotationRoute(
                        child: const TransitionChildView(
                            transition: "Rotation Transition")));
                  },
                  child: const Text("Rotation Transition")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(scaleRoute(
                        child: const TransitionChildView(
                            transition: "Scale Transition")));
                  },
                  child: const Text("Scale Transition")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(sizeRoute(
                        child: const TransitionChildView(
                            transition: "Size Transition")));
                  },
                  child: const Text("Size Transition")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(slideRoute(
                        child: const TransitionChildView(
                            transition: "Slide Transition")));
                  },
                  child: const Text("Slide Transition")),
            ],
          ),
        ),
      ),
    );
  }
}

class TransitionChildView extends StatelessWidget {
  final String transition;
  const TransitionChildView({Key? key, required this.transition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue,
          child: Center(
              child: Text(
            transition,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
      ),
    );
  }
}

Route fadeRoute({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      final tween = Tween<double>(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.fastOutSlowIn));
      final fadeAnimation = animation.drive(tween);
      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
  );
}

Route positionedRoute({required Widget child, required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    reverseTransitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin =
          RelativeRect.fromSize(const Rect.fromLTWH(0, 0, 200, 200), size);
      final end = RelativeRect.fromSize(
          Rect.fromLTWH(0, 0, size.width, size.height), size);
      final tween = RelativeRectTween(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.fastOutSlowIn));
      final positionedAnimation = animation.drive(tween);
      return Stack(
        children: [
          PositionedTransition(
            rect: positionedAnimation,
            child: child,
          ),
        ],
      );
    },
  );
}

Route rotationRoute({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      final tween = Tween<double>(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.fastOutSlowIn));
      final rotationAnimation = animation.drive(tween);
      return RotationTransition(
        turns: rotationAnimation,
        child: child,
      );
    },
  );
}

Route scaleRoute({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      final tween = Tween<double>(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.fastOutSlowIn));
      final scaleAnimation = animation.drive(tween);
      return ScaleTransition(
        scale: scaleAnimation,
        child: child,
      );
    },
  );
}

Route sizeRoute({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation =
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
      return Align(
        child: SizeTransition(
          sizeFactor: animation,
          axis: Axis.horizontal,
          axisAlignment: 0.0,
          child: child,
        ),
      );
    },
  );
}

Route slideRoute({required Widget child}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset(0.0, 0.0);
      final tween = Tween<Offset>(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.fastOutSlowIn));
      final slideAnimation = animation.drive(tween);
      return SlideTransition(
        position: slideAnimation,
        child: child,
      );
    },
  );
}
