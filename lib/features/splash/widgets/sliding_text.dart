import 'package:flutter/material.dart';
import 'package:interview/core/utils/app_string.dart';
import 'package:interview/core/utils/app_text_style.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              
              AppStrings.appName,
              textAlign: TextAlign.center,
              style: CustomTextStyles.saira700style32,
            ),
          );
        });
  }
}
