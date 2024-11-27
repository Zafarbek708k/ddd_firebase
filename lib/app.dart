import 'package:ddd_firebase/application/chat_bloc/chat_bloc.dart';
import 'package:ddd_firebase/application/favorite_bloc/favorite_bloc.dart';
import 'package:ddd_firebase/application/home_bloc/home_bloc.dart';
import 'package:ddd_firebase/application/profile_bloc/profile_bloc.dart';
import 'package:ddd_firebase/application/search_bloc/search_bloc.dart';
import 'package:ddd_firebase/presentation/core/const/all_library.dart';
import 'package:device_preview/device_preview.dart';


class App extends StatelessWidget {
  const App({super.key});


  static void run() =>
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AuthBloc()),
            BlocProvider(create: (_) => ThemeCubit()),
            BlocProvider(create: (_) => LocaleCubit()),
            BlocProvider(create: (_) => HomeBloc()),
            BlocProvider(create: (_) => SearchBloc()),
            BlocProvider(create: (_) => FavoriteBloc()),
            BlocProvider(create: (_) => ChatBloc()),
            BlocProvider(create: (_) => ProfileBloc()),
          ],
          child: DevicePreview(
            enabled: !kReleaseMode,
            builder: (context) => const App(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => KeyboardDismisser(
            gestures: const [GestureType.onTap, GestureType.onDoubleTap],
            child: BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, theme) {
                return BlocBuilder<LocaleCubit, Locale>(
                  builder: (context, locale) {
                    return MaterialApp.router(
                      title: "DDD Architecture",
                      supportedLocales: AppLocalizations.supportedLocales,
                      localizationsDelegates: AppLocalizations.localizationsDelegates,
                      debugShowCheckedModeBanner: false,
                      theme: theme,
                      locale: locale,
                      routerConfig: AppRouter.router,
                    );
                  },
                );
              },
            ),
          ),
    );
  }
}



