import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool textAlignCenter;
  final bool obscureText;
  final TextEditingController controller;
  final Function? validator;
  final Function? onChanged;

  const CustomTextField({
    super.key,
    required this.hint,
    this.textAlignCenter = false,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.onChanged,
  });

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  CommonComponents commonComponents = CommonComponents();
  Util util = Util();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: util.isWebPlatform() ? Dimensions.textFieldWidthWeb : double.infinity,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          /*enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.primary,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.black,
            ),
          ),*/
          hintStyle: commonComponents.getHintTextStyle(),
          hintText: widget.hint,
        ),
        obscureText: widget.obscureText,
        textAlign: widget.textAlignCenter ? TextAlign.center : TextAlign.start,
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
        },
      ),
    );
  }
}
