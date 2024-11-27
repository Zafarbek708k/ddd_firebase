import 'package:ddd_firebase/presentation/core/const/all_library.dart';

void run() => l.capture<void>(
      () => runZonedGuarded<void>(
        () async {
          await setup();
          l.e("L capture body function");
          await SystemChrome.setPreferredOrientations([]).then(
            (_) => App.run(),
          );
        }, // body

        (final error, final stackTree) {
          l.e("l_capture error section");
          l.e("io_top_level_error: $error && $stackTree", stackTree);
        },
      ), // onError
      const LogOptions(
        printColors: true,
        handlePrint: true,
        outputInRelease: true,
      ),
    );
