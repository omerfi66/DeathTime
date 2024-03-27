import 'package:flutter/material.dart';

class AnimatedSplashScreenBody extends StatefulWidget {
  const AnimatedSplashScreenBody({Key? key}) : super(key: key);

  @override
  _AnimatedSplashScreenBodyState createState() =>
      _AnimatedSplashScreenBodyState();
}

class _AnimatedSplashScreenBodyState extends State<AnimatedSplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: _animationController.value,
            child: Image.asset('assets/death.png'),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
