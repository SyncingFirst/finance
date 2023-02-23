import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final bool textAlignCenter;
  final bool obscureText;
  final bool isPagination;
  final TextEditingController controller;
  final Function? validator;
  final Function? onChanged;

  const SearchTextField({
    super.key,
    required this.hint,
    required this.inputType,
    this.textAlignCenter = false,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.isPagination = false,
    this.onChanged,
  });

  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  CommonComponents commonComponents = CommonComponents();
  Util util = Util();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: util.isWebPlatform() ? Dimensions.searchTextFieldWidthWeb : double.infinity,
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorResources.white,
              ),
              borderRadius: BorderRadius.circular(Dimensions.cardRadiusRounded),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorResources.white,
              ),
              borderRadius: BorderRadius.circular(Dimensions.cardRadiusRounded),
            ),
            hintStyle: commonComponents.getHintTextStyle(),
            hintText: widget.hint,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          keyboardType: widget.inputType,
          obscureText: widget.obscureText,
          textAlign: widget.textAlignCenter ? TextAlign.center : TextAlign.start,
          onChanged: (text) {
            if (widget.onChanged != null) {
              if (widget.isPagination) {
                widget.onChanged!(text, false);
              } else {
                widget.onChanged!(text);
              }
            }
          },
        ));
  }
}
