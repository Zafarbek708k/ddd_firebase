import 'package:ddd_firebase/presentation/core/const/all_library.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, this.onPressed, this.borderC, this.textC, this.height, this.width, this.borderWidth, this.title, this.textS, this.leftP, this.rightP, this.topP, this.bottomP, this.fontWeight});

  final VoidCallback? onPressed;
  final Color? borderC, textC;
  final double? height, width, borderWidth, textS, leftP, rightP, topP, bottomP;
  final String? title;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftP ?? 0, right: rightP ?? 0, top: topP ?? 10, bottom: bottomP ?? 10),
      child: AnimationButtonEffect(
        child: MaterialButton(
          height: height ?? 60,
          minWidth: width ?? double.infinity,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderC ?? Colors.blue, width: borderWidth ?? 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomTextWidget(
            title ?? "",
            color: textC ?? context.appTheme.secondary,
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: textS ?? 20,
          ),
        ),
      ),
    );
  }
}
