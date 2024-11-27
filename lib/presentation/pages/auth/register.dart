import 'package:ddd_firebase/presentation/core/const/all_library.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();
  TextEditingController fullNameCtr = TextEditingController();

  @override
  void dispose() {
    emailCtr.dispose();
    passCtr.dispose();
    fullNameCtr.dispose();
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
                SizedBox(height: 250, width: double.infinity, child: SvgPicture.asset("assets/svg/register.svg")),
                TextFieldWidget(controller: fullNameCtr, hintText: "Full Name", borderColor: Colors.cyan),
                TextFieldWidget(controller: emailCtr, hintText: "Email", borderColor: Colors.deepOrange),
                TextFieldWidget(controller: passCtr, hintText: "Password", keyboardType: TextInputType.number, borderColor: Colors.lightGreenAccent),
                MainButton(onPressed: () => context.go(AppRouteName.login), title: context.localized.signUp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      customBorder: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                      overlayColor: WidgetStateProperty.all(Colors.lightGreenAccent),
                      radius: 15,
                      onTap: () => context.go(AppRouteName.login),
                      child: CustomTextWidget(context.localized.haveAnAccount, color: context.appTheme.outline),
                    ),
                  ],
                ),
                const Spacer(flex:2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
