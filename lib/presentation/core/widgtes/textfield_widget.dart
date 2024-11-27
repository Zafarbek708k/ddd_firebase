
import '../const/all_library.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
        required this.controller,
        this.hintText,
        this.labelText,
        this.labelFontSize,
        this.hintFontSize,
        this.suffixIcon,
        this.prefixIcon,
        this.borderColor, this.keyboardType});

  final TextEditingController controller;
  final String? hintText, labelText;
  final double? labelFontSize, hintFontSize;
  final Widget? suffixIcon, prefixIcon;
  final Color? borderColor;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        cursorColor: context.appTheme.secondary,
        controller: controller,
        style:   TextStyle(
          fontSize: 18,
          color: context.appTheme.secondary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: labelFontSize,
            fontWeight: FontWeight.bold,
            color: context.appTheme.secondary,
          ),
          hintStyle: TextStyle(
            fontSize: hintFontSize,
            color: context.appTheme.secondary,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: borderColor ?? Colors.blue.shade900, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: borderColor ?? Colors.blue.shade900, width: 2),
          ),
        ),
      ),
    );
  }
}