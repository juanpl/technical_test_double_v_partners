import 'package:go_router/go_router.dart';
import '../../features/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [

    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/profile_features',
      name: ProfileScreen.name,
      builder: (context, state) {
        final String? email = state.uri.queryParameters['email'];
        final String? password = state.uri.queryParameters['password'];
        return ProfileScreen(email: email, password: password);
      },
    ),

    GoRoute(
      path: '/sign_on',
      name: SignUpScreen.name,
      builder: (context, state) => SignUpScreen(),
    ),
  ]
);