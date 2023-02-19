import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/generated/l10n.dart';
import 'package:tictok_clone/screens/features/authentication/login_screen.dart';
import 'package:tictok_clone/screens/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/";
  const SignUpScreen({super.key});
  void _onLoginTap(BuildContext context) async {
    /* await Navigator.of(context).push(
      PageRouteBuilder(
          transitionDuration: const Duration(
            seconds: 1,
          ),
          reverseTransitionDuration: const Duration(
            seconds: 1,
          ),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const UserNameScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final offsetAnimation = Tween(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation);

            final opacityAnimation =
                Tween(begin: 0.5, end: 1.0).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: opacityAnimation,
                child: child,
              ),
            );
          }),
    ); */
    Navigator.of(context).pushNamed(LoginScreen.login);
  }

  @override
  Widget build(BuildContext context) {
    Localizations.localeOf(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(
                    S.of(context).signUpTitle("TikTok"),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Gaps.v20,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      S.of(context).createProrile,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                      movePage: MovePage.emailJoin,
                      icon: const FaIcon(FontAwesomeIcons.user),
                      text: S.of(context).EmailPasswordButton,
                    ),
                    Gaps.v16,
                    const AuthButton(
                        movePage: MovePage.facebook,
                        icon: FaIcon(FontAwesomeIcons.facebook),
                        text: "Continue with Facebook"),
                    Gaps.v16,
                    const AuthButton(
                        movePage: MovePage.apple,
                        icon: FaIcon(FontAwesomeIcons.apple),
                        text: "Continue with Apple"),
                    Gaps.v16,
                    const AuthButton(
                        movePage: MovePage.google,
                        icon: FaIcon(FontAwesomeIcons.google),
                        text: "Continue with Google"),
                  ],
                  if (orientation == Orientation.landscape) ...[
                    ...[
                      Row(
                        children: const [
                          Expanded(
                            child: AuthButton(
                                movePage: MovePage.emailJoin,
                                icon: FaIcon(FontAwesomeIcons.user),
                                text: "Use email & password"),
                          ),
                          Gaps.h16,
                          Expanded(
                            child: AuthButton(
                                movePage: MovePage.facebook,
                                icon: FaIcon(FontAwesomeIcons.facebook),
                                text: "Continue with Facebook"),
                          ),
                        ],
                      ),
                      Gaps.v4,
                      Row(
                        children: const [
                          Expanded(
                            child: AuthButton(
                                movePage: MovePage.apple,
                                icon: FaIcon(FontAwesomeIcons.apple),
                                text: "Continue with Apple"),
                          ),
                          Gaps.h16,
                          Expanded(
                            child: AuthButton(
                                movePage: MovePage.google,
                                icon: FaIcon(FontAwesomeIcons.google),
                                text: "Continue with Google"),
                          ),
                        ],
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
