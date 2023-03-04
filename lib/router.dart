import 'package:go_router/go_router.dart';
import 'package:tictok_clone/screens/features/authentication/email_screen.dart';
import 'package:tictok_clone/screens/features/authentication/login_form_screen.dart';
import 'package:tictok_clone/screens/features/authentication/login_screen.dart';
import 'package:tictok_clone/screens/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone/screens/features/authentication/username_screen.dart';
import 'package:tictok_clone/screens/features/users/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: LoginFormScreen.routeName,
      builder: (context, state) => const LoginFormScreen(),
    ),
    GoRoute(
      path: UserNameScreen.username,
      builder: (context, state) => const UserNameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        return UserProfileScreen(username: username.toString());
      },
    ),
  ],
);
