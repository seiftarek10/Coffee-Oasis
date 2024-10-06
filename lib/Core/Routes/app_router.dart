import 'package:coffee_oasis/Core/Routes/page_transition.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner_home.dart';
import 'package:coffee_oasis/Features/Splash%20Screen/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            pageTransition(context, state, const SplashView())),
        GoRoute(
        path: Routes.ownerHome,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const OwnerHome())),
  ],
);
