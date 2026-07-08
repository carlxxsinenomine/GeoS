import 'package:geos/features/map/presentation/screens/map_screen.dart';
import 'package:geos/features/weather/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/map', builder: (context, state) => MapScreen()),
  ],
);
