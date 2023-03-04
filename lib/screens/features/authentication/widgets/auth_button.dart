import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/authentication/login_form_screen.dart';
import 'package:tictok_clone/screens/features/authentication/username_screen.dart';

enum MovePage { emailJoin, emailLogin, apple, facebook, google }

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final MovePage movePage;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.movePage,
  });

  // set Function
  void _onTap(BuildContext context) {
    context.push(_pushScreen());
  }

  _pushScreen() {
    switch (movePage) {
      case MovePage.emailJoin:
        return UserNameScreen.username;
      case MovePage.emailLogin:
        return LoginFormScreen.routeName;
    }
  }
  // finish set Function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.size14),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey.shade200,
            width: Sizes.size2,
          )),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: Sizes.size16, fontWeight: FontWeight.w600),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
