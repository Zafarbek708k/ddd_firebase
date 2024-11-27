import 'package:ddd_firebase/presentation/pages/auth/verification.dart';
import 'package:ddd_firebase/presentation/pages/search/search.dart';
import '../const/all_library.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell-key');
late StatefulNavigationShell navigationShell2;

@immutable
final class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
      navigatorKey: appNavigatorKey,
      initialLocation: AppRouteName.splash,
      routes: [
        GoRoute(path: AppRouteName.splash, builder: (context, state) => const Splash()),
        // GoRoute(path: AppRouteName.authGate, builder: (context, state) => const AuthGate()),

        GoRoute(
          path: AppRouteName.login,
          builder: (context, state) => const Login(),
          routes: [
            GoRoute(path: AppRouteName.register, builder: (context, state) => const Register()),
            GoRoute(path: AppRouteName.forgetPassword, builder: (context, state) => const ForgotPassword()),
            GoRoute(path: AppRouteName.verification, builder: (context, state) => const Verification()),
          ],
        ),

        /// Patient Shell Route
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: appNavigatorKey,
          builder: (context, state, navigationShell) {
            navigationShell2 = navigationShell;
            return MainWrapper(navigationShell: navigationShell);
          },
          branches: [
            // home search favorite chat profile
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKey,
              routes: [
                GoRoute(
                  path: AppRouteName.home,
                  pageBuilder: (context, state) => const NoTransitionPage(child: Home()),
                  routes: const [
                    // SubRoutes.categoryDetail,
                    // SubRoutes.subject,
                    // GoRoute(
                    //   parentNavigatorKey: appNavigatorKey,
                    //   path: AppRouteName.favorite,
                    //   pageBuilder: (BuildContext context, GoRouterState state) {
                    //     // bu sub pagedan turib asosiy pagega qaytganda bottom navbardi ozgartirish uchun kerak bo'ladi
                    //     // return MaterialPage(child: Favorite(navigationShell: navigationShell2));
                    //     return const MaterialPage(child: Scaffold());
                    //   },
                    // )
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRouteName.search,
                  pageBuilder: (context, state) => const NoTransitionPage(child: Search()),
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRouteName.favorite,
                  pageBuilder: (context, state) => const NoTransitionPage(child: Favorite()),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRouteName.chat,
                  pageBuilder: (context, state) => const NoTransitionPage(child: Chat()),
                  routes: const [],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRouteName.profile,
                  pageBuilder: (context, state) => const NoTransitionPage(child: Profile()),
                ),
              ],
            ),
          ],
        ),
      ],
      // redirect: (context, state){
      //   // final bool AppInterceptor.ins
      // },
      // debugLogDiagnostics: true,
      errorBuilder: (context, state) =>
          Scaffold(body: Center(child: InkWell(onTap: () => context.go(AppRouteName.home), child: const Text(" Error Builder go Home ")))));
}
