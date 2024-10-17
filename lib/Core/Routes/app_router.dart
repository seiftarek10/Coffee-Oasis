import 'package:coffee_oasis/Core/Routes/page_transition.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Screens/sign_in_view.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Screens/sign_up_view.dart';
import 'package:coffee_oasis/Features/Delivery/Presentation/Views/delivery.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Screens/category_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Screens/manage_categories.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner.dart';
import 'package:coffee_oasis/Features/Splash%20Screen/splash_view.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Screens/staff_home_view.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Screens/staff_order_details.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Screens/coffee_details_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Screens/favorite_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Screens/order_details.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/user.dart';
import 'package:coffee_oasis/coffee_oasis.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final Flavor flavor;

  AppRouter({required this.flavor});

  GoRouter get router {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return pageTransition(
                context,
                state,
                SplashView(flavor: flavor),
           
                );
          },
        ),
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
                pageTransition(context, state, const StaffOrderDetailsView())),
        GoRoute(
            path: Routes.staff,
            pageBuilder: (context, state) =>
                pageTransition(context, state, const StaffHomeView())),
        GoRoute(
            path: Routes.delivery,
            pageBuilder: (context, state) =>
                pageTransition(context, state, const DeliveryView())),
        GoRoute(
            path: Routes.manageCategories,
            pageBuilder: (context, state) =>
                pageTransition(context, state, const ManageCategories()))
      ],
    );
  }
}
