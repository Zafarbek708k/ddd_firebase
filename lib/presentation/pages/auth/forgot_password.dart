
import 'package:ddd_firebase/presentation/core/const/all_library.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();
  TextEditingController confirmPassCtr = TextEditingController();

  @override
  void dispose() {
    emailCtr.dispose();
    passCtr.dispose();
    confirmPassCtr.dispose();
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
                SizedBox(height: 250, width: double.infinity, child: SvgPicture.asset("assets/svg/forgot_password.svg")),
                TextFieldWidget(controller: emailCtr, hintText: "Email", borderColor: Colors.deepOrange),
                TextFieldWidget(
                  controller: passCtr,
                  hintText: "New Password",
                  keyboardType: TextInputType.number,
                  borderColor: (passCtr.text != confirmPassCtr.text) ? Colors.red : Colors.lightGreenAccent,
                ),
                TextFieldWidget(
                  controller: confirmPassCtr,
                  hintText: "Confirm Password",
                  keyboardType: TextInputType.number,
                  borderColor: (passCtr.text != confirmPassCtr.text) ? Colors.red : Colors.lightGreenAccent,
                ),
                const SizedBox(height: 10),
                MainButton(onPressed: () => context.go("${AppRouteName.login}/${AppRouteName.verification}"), title: context.localized.sendCode),
                const Spacer(flex:2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
