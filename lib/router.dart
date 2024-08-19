import 'package:go_router/go_router.dart';
import 'package:queue_buster/constants/route_names.dart';
import 'package:queue_buster/pages/email_verification.dart';
import 'package:queue_buster/pages/login.dart';
import 'package:queue_buster/pages/menu.dart';
import 'package:queue_buster/pages/profile.dart';
import 'package:queue_buster/pages/select_location.dart';
import 'package:queue_buster/pages/settings.dart';
import 'package:queue_buster/pages/signup.dart';
import 'package:queue_buster/pages/home.dart';
import 'package:queue_buster/pages/stores.dart';
import 'package:queue_buster/widgets/consumer_layout.dart';
import 'package:queue_buster/pages/cart.dart';

final GoRouter goRouter =
    GoRouter(initialLocation: RouteNames.home.path, routes: [
  GoRoute(
      path: RouteNames.authSignup.path,
      builder: (context, state) => const SignupPage()),
  GoRoute(
      path: RouteNames.authLogin.path,
      builder: (context, state) => const LoginPage()),
  GoRoute(
    path: RouteNames.emailVerification.path,
    builder: (context, state) => const EmailVerificationPage(),
  ),

  GoRoute(
    path: RouteNames.profile.path,
    builder: (context, state) => const ProfilePage(),
  ),
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.home.path,
                builder: (context, state) => const HomePage()),
            GoRoute(
                path: RouteNames.selectLocation.path,
                builder: (context, state) => const SelectLocationPage()),

          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.stores.path,
                builder: (context, state) => const StoresPage()),
            GoRoute(
                path: "${RouteNames.menu.path}/:id",
                builder: (context, state) => MenuPage(
                  storeId:int.parse(state.pathParameters["id"]!)
                )),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.cart.path,
                builder: (context, state) => const CartPage()),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteNames.settings.path,
                builder: (context, state) => const SettingsPage()),
          ],
        ),
      ]),
]);
