import 'package:ddd_firebase/presentation/core/const/all_library.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: Colors.deepOrangeAccent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SizedBox(height: 250, child: SvgPicture.asset("assets/svg/verication_otp.svg")),
              Pinput(
                controller: pinController,
                autofillHints: const [AutofillHints.oneTimeCode],
                length: 4,
                toolbarEnabled: false,
                defaultPinTheme: defaultPinTheme,
              ),
              MainButton(onPressed: () => context.go(AppRouteName.login), title: context.localized.check, borderC: Colors.deepOrange),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
