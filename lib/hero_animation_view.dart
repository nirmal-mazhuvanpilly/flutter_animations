import 'package:flutter/material.dart';

class HeroAnimationView extends StatelessWidget {
  const HeroAnimationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: Container(
        color: Colors.grey.shade400,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Hero(
              tag: "Hero",
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const HeroAnimationChildView();
                    },
                  ));
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text("Click on Icon to view Hero Animation")
          ],
        ),
      ),
    );
  }
}

class HeroAnimationChildView extends StatelessWidget {
  const HeroAnimationChildView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: Hero(
        tag: "Hero",
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
