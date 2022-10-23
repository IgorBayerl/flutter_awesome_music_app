import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/header.dart';
import 'widgets/login_form.dart';

class Login extends StatefulWidget {
  final double screenHeight;

  const Login({
    super.key, 
    required this.screenHeight,
  });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _headerTextAnimation;
  late final Animation<double> _formElementAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.4,
        curve: Curves.easeInOut,
      ),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.2,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));

    

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kPaddingL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Header(animation: _headerTextAnimation),
              // const Spacer(),
              LoginForm(animation: _formElementAnimation),
            ],
          ),
        ),
      ),
    );
  }
}
