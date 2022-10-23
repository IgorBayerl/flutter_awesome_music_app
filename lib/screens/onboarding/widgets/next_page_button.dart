import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

class NextPageButton extends StatefulWidget {
  final VoidCallback onPressed;
  final PageController pageController;
  final AnimationController animationController;
  final int count;

  const NextPageButton({
    super.key,
    required this.onPressed,
    required this.pageController,
    required this.animationController,
    required this.count,
  });

  @override
  _NextPageButtonState createState() => _NextPageButtonState();
}

class _NextPageButtonState extends State<NextPageButton>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      elevation: 0.0,
      shape: const CircleBorder(),
      // fillColor: Colors.red,
      onPressed: widget.onPressed,
      child: Lottie.asset(
        'assets/next-button-animation.json',
        controller: widget.animationController,
        height: 200,
      ),
    );
  }
}
