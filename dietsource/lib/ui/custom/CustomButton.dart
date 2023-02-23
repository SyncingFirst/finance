import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/Constants.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool leadingIcon;
  final String text;
  final bool trailingIcon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.leadingIcon = false,
    required this.text,
    this.trailingIcon = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.cardRadiusRounded),
              side: const BorderSide(color: ColorResources.primary),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(Dimensions.paddingMedium),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: ColorResources.white,
            fontFamily: Constants.fontMedium,
            fontSize: Dimensions.fontMedium,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
