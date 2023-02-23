import 'package:dietsource/ui/login/LoginLayout.dart';
import 'package:flutter/material.dart';

import '../../utils/Colors.dart';
import '../../utils/Dimensions.dart';

class LoginSmallScreenLayout extends LoginLayout {
  const LoginSmallScreenLayout(
      {super.key,
      required super.commonComponents,
      required super.logo,
      required super.email,
      required super.password,
      required super.loginBtn,
      required super.signUp,
      required super.forgotPassword});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: ColorResources.bg,
        padding: const EdgeInsets.all(
          Dimensions.paddingDefault,
        ),
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: [
            logo,
            commonComponents.getVerticalSpacing(),
            commonComponents.getVerticalSpacing(),
            commonComponents.getVerticalSpacing(),
            commonComponents.getVerticalSpacing(),
            commonComponents.getVerticalSpacing(),
            Card(
              elevation: Dimensions.cardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.cardRadiusMedium),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  Dimensions.paddingLarge,
                  Dimensions.paddingDefault,
                  Dimensions.paddingLarge,
                  Dimensions.paddingDefault,
                ),
                child: email,
              ),
            ),
            commonComponents.getVerticalSpacing(),
            Card(
              elevation: Dimensions.cardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.cardRadiusMedium),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  Dimensions.paddingLarge,
                  Dimensions.paddingDefault,
                  Dimensions.paddingLarge,
                  Dimensions.paddingDefault,
                ),
                child: password,
              ),
            ),
            commonComponents.getVerticalSpacing(),
            loginBtn,
            commonComponents.getVerticalSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                signUp,
                forgotPassword,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
