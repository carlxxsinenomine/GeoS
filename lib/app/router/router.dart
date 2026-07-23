import 'package:flutter/material.dart';
import 'package:geos/features/auth/presentation/screens/login_screen.dart';
import 'package:geos/features/auth/presentation/screens/register_screen.dart';
import 'package:geos/features/map/presentation/screens/map_screen.dart';
import 'package:geos/features/profile/presentation/screens/profile_screen.dart';
import 'package:geos/features/weather/presentation/screens/home_screen.dart';
import 'package:geos/shared/widgets/bottom_nav.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: LoginScreen.path,
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: HomeScreen.path,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
            path: MapScreen.path,
            builder: (context, state) => MapScreen()
        ),
        GoRoute(
          path: ProfileScreen.path,
          builder: (context, state) => ProfileScreen(),
        ),
      ],
      builder: (context, state, child) {
        return Scaffold(
          extendBody: true,
          body: child,
          bottomNavigationBar: BottomNav(currentPath: state.uri.toString()),
        );
      },
    ),
    GoRoute(path: LoginScreen.path, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: RegisterScreen.path,
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);
