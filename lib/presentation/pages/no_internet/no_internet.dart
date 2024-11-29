import 'dart:developer';

import 'package:ddd_firebase/presentation/core/const/all_library.dart';
import 'package:flutter_svg/svg.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        log("PopScope Value: $value");
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200, child: SvgPicture.asset("assets/svg/No-connection-bro.svg")),
              const SizedBox(height: 80),
              const Text(
                'No Internet Connection',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No internet connection found. Check your \n connection or try again!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
