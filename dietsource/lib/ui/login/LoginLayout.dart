import 'package:dietsource/utils/CommonComponents.dart';
import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  final CommonComponents commonComponents;
  final Widget logo;
  final Widget email;
  final Widget password;
  final Widget loginBtn;
  final Widget signUp;
  final Widget forgotPassword;

  const LoginLayout({
    super.key,
    required this.commonComponents,
    required this.logo,
    required this.email,
    required this.password,
    required this.loginBtn,
    required this.signUp,
    required this.forgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
