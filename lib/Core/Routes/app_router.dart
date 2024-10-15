import 'package:coffee_oasis/Core/Routes/page_transition.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Screens/sign_in_view.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Screens/sign_up_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Screens/category_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Screens/staff_order_details.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Screens/coffee_details_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Screens/favorite_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Screens/order_details.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/user.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        pageBuilder: (context, state) => 
            pageTransition(context, state, const UserView())),
    // GoRoute(
    //     path: '/',
    //     pageBuilder: (context, state) =>
    //         pageTransition(context, state, const SplashView())),
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
            pageTransition(context, state, const CoffeeDetailsView())),
    GoRoute(
        path: Routes.orderDetails,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const OrderDetailsView())),
    GoRoute(
        path: Routes.favorite,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const FavoriteView())),
    GoRoute(
        path: Routes.signup,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const SignUpView())),
    GoRoute(
        path: Routes.signin,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const SignInView())),
    GoRoute(
        path: Routes.staffOrderDetails,
        pageBuilder: (context, state) =>
            pageTransition(context, state, const StaffOrderDetailsView()))
  ],
);
