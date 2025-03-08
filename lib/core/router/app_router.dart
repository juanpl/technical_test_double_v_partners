import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/Login',
  routes: [

    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/profile_features',
      name: ProfileScreen.name,
      builder: (context, state) => ProfileScreen(),
    ),

    GoRoute(
      path: '/sign_on',
      name: SignUpScreen.name,
      builder: (context, state) => SignUpScreen(),
    ),
  ]
);