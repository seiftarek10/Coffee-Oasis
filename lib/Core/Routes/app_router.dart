import 'package:coffee_oasis/Core/Routes/route_transition.dart';
import 'package:coffee_oasis/Features/Splash%20Screen/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            pageTransition(context, state, const SplashView())),
  ],
);
