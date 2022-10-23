// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/onboarding/pages/onboarding_page_1.dart';
import 'package:flutter_awesome_music_app/screens/onboarding/pages/onboarding_page_3.dart';
import 'package:flutter_awesome_music_app/screens/onboarding/widgets/next_page_button.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/login.dart';
import 'pages/onboarding_page_2.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  const Onboarding({
    super.key,
    required this.screenHeight,
  });

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  final _pageController = PageController();
  late AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  final List<Widget> _onboardingPages = [
    const OnboardingPage1(),
    const OnboardingPage2(),
    const OnboardingPage3(),
    const OnboardingPage3(),
    const OnboardingPage3(),
    const OnboardingPage3(),
  ];

  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _animationController = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleOnClickNextButton() async {
    if (_isLastPage) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(
            screenHeight: widget.screenHeight,
          ),
        ),
      );
    }
    await _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCirc,
    );
  }

  void _handlePageChanged(int index) {
    setState(() {
      _isLastPage = _checkIfLastPage(index);
    });
    if (_isLastPage) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _handleOnTapSkipButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          screenHeight: widget.screenHeight,
        ),
      ),
    );
  }

  bool _checkIfLastPage(int index) {
    return index == _onboardingPages.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: _handlePageChanged,
            controller: _pageController,
            children: _onboardingPages,
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.topRight,
              child: MaterialButton(
                padding: const EdgeInsets.all(0),
                elevation: 0.0,

                shape: const CircleBorder(),
                // fillColor: Colors.red,
                onPressed: _handleOnTapSkipButton,
                child: const Text('Skip'),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: _onboardingPages.length,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.teal,
                        expansionFactor: 4,
                        spacing: 8,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 30),
                    child: NextPageButton(
                      pageController: _pageController,
                      animationController: _animationController,
                      count: _onboardingPages.length,
                      onPressed: _handleOnClickNextButton,
                    ),
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
