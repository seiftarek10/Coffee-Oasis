import 'package:coffee_oasis/Core/Routes/page_transition.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/category_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner.dart';
import 'package:coffee_oasis/Features/Splash%20Screen/splash_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/coffee_details_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/user.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            pageTransition(context, state, const SplashView())),
    GoRoute(
        path: Routes.owner,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const OwnerView())),
    GoRoute(
        path: Routes.category,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const CategoryView())),
    GoRoute(
        path: Routes.user,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const UserView())),
    GoRoute(
        path: Routes.coffeeDetails,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const CoffeeDetailsView()))
  ],
);
