import 'package:ddd_firebase/presentation/core/const/all_library.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();

  @override
  void dispose() {
    emailCtr.dispose();
    passCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: context.appTheme.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(flex:1),
                SizedBox(height: 250, width: double.infinity, child: SvgPicture.asset("assets/svg/login.svg")),
                TextFieldWidget(controller: emailCtr, hintText: "Email", borderColor: Colors.deepOrange),
                TextFieldWidget(controller: passCtr, hintText: "Password", keyboardType: TextInputType.number, borderColor: Colors.lightGreenAccent),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      customBorder: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                      overlayColor: WidgetStateProperty.all(Colors.lightGreenAccent),
                      radius: 15,
                      onTap: () => context.go("${AppRouteName.login}/${AppRouteName.forgetPassword}"),
                      child:  CustomTextWidget(context.localized.forgotPassword, color: Colors.red),
                    ),
                  ],
                ),
                MainButton(onPressed: () => context.go(AppRouteName.home), title: context.localized.signIn),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      customBorder: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                      overlayColor: WidgetStateProperty.all(Colors.lightGreenAccent),
                      radius: 15,
                      onTap: () => context.go("${AppRouteName.login}/${AppRouteName.register}"),
                      child: CustomTextWidget(
                        context.localized.donTHaveAnAccount,
                        color: context.appTheme.outline,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex:2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
