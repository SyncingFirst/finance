import 'package:dietsource/localization/MyAppLocalization.dart';
import 'package:dietsource/routes/RouteConstants.dart';
import 'package:dietsource/ui/custom/CustomButton.dart';
import 'package:dietsource/ui/custom/CustomTextField.dart';
import 'package:dietsource/ui/login/LoginSmallScreenLayout.dart';
import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CommonComponents commonComponents = CommonComponents();
  Util util = Util();

  final TextEditingController _tecEmailAddress = TextEditingController();
  final TextEditingController _tecPassword = TextEditingController();

  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    commonComponents.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonComponents.getSvgImageInSizedBox("ic_logo", false, false, true),
            commonComponents.getVerticalSpacing(),
            Text(
              MyAppLocalization.of(context)!.translate("please_enter_mobile_number"),
              style: commonComponents.getBoldTextStyle(),
            ),
            commonComponents.getVerticalSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryCodePicker(
                  initialSelection: Constants.defaultCountry,
                  onChanged: (CountryCode countryCode) {
                    if (countryCode.dialCode != null) {
                      selectedCountryCode = countryCode.dialCode!;
                    }
                  },
                ),
                commonComponents.getHorizontalSpacing(),
                CustomTextField(
                  hint: MyAppLocalization.of(context)!.translate("mobile_number"),
                  inputType: TextInputType.number,
                  textAlignCenter: true,
                  controller: _tecMobileNumber,
                ),
              ],
            ),
            commonComponents.getVerticalSpacing(),
            CustomButton(
              text: MyAppLocalization.of(context)!.translate("send_otp"),
              onPressed: () {
                login();
              },
            ),
          ],
        ),
      ),*/
      body: LoginSmallScreenLayout(
        commonComponents: commonComponents,
        logo: logo(),
        email: email(),
        password: password(),
        loginBtn: loginBtn(),
        signUp: signUp(),
        forgotPassword: forgotPassword(),
      ),
    );
  }

  logo() {
    return commonComponents.getSvgImageInSizedBox("ic_logo", true, false, false);
  }

  email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MyAppLocalization.of(context)!.translate("email.address"),
          style: commonComponents.getRegularTextStyle(),
        ),
        Row(
          children: [
            const Icon(Icons.email),
            commonComponents.getHorizontalSpacing(),
            Expanded(
              child: CustomTextField(
                hint: MyAppLocalization.of(context)!.translate("email.address"),
                textAlignCenter: false,
                controller: _tecEmailAddress,
              ),
            ),
          ],
        ),
      ],
    );
  }

  password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MyAppLocalization.of(context)!.translate("password"),
          style: commonComponents.getRegularTextStyle(),
        ),
        Row(
          children: [
            const Icon(Icons.password),
            commonComponents.getHorizontalSpacing(),
            Expanded(
              child: CustomTextField(
                hint: MyAppLocalization.of(context)!.translate("password"),
                textAlignCenter: false,
                obscureText: hidePassword,
                controller: _tecPassword,
              ),
            ),
            commonComponents.getHorizontalSpacing(),
            InkWell(
              child: const Icon(Icons.hide_image),
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  loginBtn() {
    return CustomButton(
      text: MyAppLocalization.of(context)!.translate("login"),
      onPressed: () {
        login();
      },
    );
  }

  signUp() {
    return InkWell(
      child: Text(
        MyAppLocalization.of(context)!.translate("signup"),
        style: commonComponents.getRegularTextStyle(),
      ),
      onTap: () {},
    );
  }

  forgotPassword() {
    return InkWell(
      child: Text(
        MyAppLocalization.of(context)!.translate("forgot.password"),
        style: commonComponents.getRegularTextStyle(),
      ),
      onTap: () {},
    );
  }

  login() async {
    /*if (util.validateMobileNumber(_tecMobileNumber.text)) {
      commonComponents.showProgress();

      LoginRequest request = LoginRequest();
      request.countryCode = selectedCountryCode;
      request.email = "";
      request.language = Constants.defaultLanguage;
      request.phoneNumber = _tecMobileNumber.text;

      LoginResponse response = await requests.login(request);
      commonComponents.hideProgress();

      Get.toNamed(RouteConstants().homePage, arguments: [
        {Constants.code: response.code}
      ]);
    }*/
    Get.offAllNamed(RouteConstants().homePage);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tecEmailAddress.dispose();
    _tecPassword.dispose();
    super.dispose();
  }
}
