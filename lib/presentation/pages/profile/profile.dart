
import 'package:ddd_firebase/presentation/core/const/all_library.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.appTheme.primary,
        title: CustomTextWidget(context.localized.profile, color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: MediaQuery.sizeOf(context) * 0.02, child: Divider(color: context.appTheme.surface)),
      ),
    );
  }
}
