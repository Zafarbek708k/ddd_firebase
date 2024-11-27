
import 'package:ddd_firebase/presentation/core/const/all_library.dart';


class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: context.appTheme.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: SvgPicture.asset("assets/svg/welcome_splash.svg"),
                ),

                MaterialButton(
                  onPressed: () => context.go(AppRouteName.login),
                  minWidth: double.infinity,
                  shape:  StadiumBorder(side: BorderSide(color: context.appTheme.outline,width: 2)),
                  child:  CustomTextWidget(context.localized.goAuth,color: context.appTheme.surface),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  shape:  StadiumBorder(side: BorderSide(color: context.appTheme.outline,width: 2)),
                  child:  CustomTextWidget(context.localized.switchTheme,color: context.appTheme.surface),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainButton(onPressed: () => context.read<LocaleCubit>().changeLocale(LangCodes.uz), title: "Uz", width: 50,height: 50),
                    MainButton(onPressed: () => context.read<LocaleCubit>().changeLocale(LangCodes.ru), title: "Ru",width: 50,height: 50),
                    MainButton(onPressed: () =>  context.read<LocaleCubit>().changeLocale(LangCodes.en), title: "En",width: 50,height: 50),
                  ],
                ),

                const SizedBox(height: 50)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
//  l.s("l.s");
// l.w("l.w");
// l.d("l.d");
// l.v("l.v");
// l.v1("l.v1");
// l.v2("l.v2");
