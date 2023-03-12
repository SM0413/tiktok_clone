import 'package:go_router/go_router.dart';
import 'package:tictok_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tictok_clone/screens/features/authentication/login_screen.dart';
import 'package:tictok_clone/screens/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone/screens/features/inbox/activity_screen.dart';
import 'package:tictok_clone/screens/features/onboarding/interests_screen.dart';

final router = GoRouter(
  initialLocation: "/inbox",
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        return MainNavigationScreen(
          tab: state.params["tab"]!,
        );
      },
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) => const ActivityScreen(),
    ),
  ],
);
