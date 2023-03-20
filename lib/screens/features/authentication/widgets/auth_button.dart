import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/authentication/login_form_screen.dart';
import 'package:tictok_clone/screens/features/authentication/username_screen.dart';
import 'package:tictok_clone/screens/features/authentication/view_models/social_auth_view_model.dart';

enum MovePage { emailJoin, emailLogin, github }

class AuthButton extends ConsumerStatefulWidget {
  final String text;
  final FaIcon icon;
  final MovePage movePage;
  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.movePage,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthButtonState();
}

class _AuthButtonState extends ConsumerState<AuthButton> {
  // set Function
  void _onTap(BuildContext context) {
    // context.push(_pushScreen());
    if (widget.movePage == MovePage.github) {
      ref.read(socialAuthProvider.notifier).githubSignIn(context);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _pushScreen(),
          ));
    }
  }

  _pushScreen() {
    switch (widget.movePage) {
      case MovePage.emailJoin:
        return const UserNameScreen();
      case MovePage.emailLogin:
        return const LoginFormScreen();
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
                widget.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: Sizes.size16, fontWeight: FontWeight.w600),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: widget.icon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
