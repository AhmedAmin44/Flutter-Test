import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/core/function/navigation.dart';

import 'sliding_text.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SlidingText(slidingAnimation: slidingAnimation));
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 7),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      customNavigateReplacement(context, '/home');
    });
  }
}
