import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/main.dart';

import '../../../constants.dart';
import 'custom_button.dart';
import 'fade_slide_transition.dart';
import '../../appSceens/main.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: FadeSlideTransition(
        additionalOffset: 16.0,
        animation: animation,
        child: Column(
          children: <Widget>[
            const CupertinoTextField(
              prefix: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.email,
                  color: kBlue,
                ),
              ),
              placeholder: 'Email',
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
            ),
            SizedBox(height: space),
            const CupertinoTextField(
              prefix: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.lock,
                  color: kBlue,
                ),
              ),
              placeholder: 'Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: space),
            CustomButton(
              color: kBlue,
              textColor: kWhite,
              text: 'Login to continue',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppScreens()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
