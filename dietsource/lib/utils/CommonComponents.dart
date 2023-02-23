import 'package:dietsource/localization/MyAppLocalization.dart';
import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/Constants.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonComponents {
  late BuildContext context;
  Util util = Util();

  setContext(BuildContext context) {
    this.context = context;
  }

  getSvgImageInSizedBox(String fileName, bool isSmall, bool isMedium, bool isLarge) {
    if (isSmall) {
      return SizedBox(
        height: util.isWebPlatform() ? Dimensions.imageHeightWebSmall : Dimensions.imageHeight,
        width: util.isWebPlatform() ? Dimensions.imageWidthWebSmall : Dimensions.imageWidth,
        child: getSvgImage(fileName),
      );
    } else if (isMedium) {
      return SizedBox(
        height: util.isWebPlatform() ? Dimensions.imageHeightWebMedium : Dimensions.imageHeight,
        width: util.isWebPlatform() ? Dimensions.imageWidthWebMedium : Dimensions.imageWidth,
        child: getSvgImage(fileName),
      );
    } else if (isLarge) {
      return SizedBox(
        height: util.isWebPlatform() ? Dimensions.imageHeightWebLarge : Dimensions.imageHeight,
        child: getSvgImage(fileName),
      );
    }
    return SizedBox(
      height: util.isWebPlatform() ? Dimensions.imageHeightWeb : Dimensions.imageHeight,
      child: getSvgImage(fileName),
    );
  }

  getPngImage(String fileName) {
    return Image(image: AssetImage("assets/png/$fileName.png"));
  }

  getSvgImage(String fileName) {
    return SvgPicture.asset("assets/svg/$fileName.svg");
  }

  getAppBarTextStyle() {
    return const TextStyle(
      color: ColorResources.white,
      fontFamily: Constants.fontBold,
      fontSize: Dimensions.fontBold,
      fontWeight: FontWeight.w700,
    );
  }

  getSmallTextStyle() {
    return const TextStyle(
      color: ColorResources.black,
      fontFamily: Constants.fontRegular,
      fontSize: Dimensions.fontSmall,
      fontWeight: FontWeight.w400,
    );
  }

  getSmallTextStylePrimary() {
    return const TextStyle(
      color: ColorResources.primary,
      fontFamily: Constants.fontRegular,
      fontSize: Dimensions.fontSmall,
      fontWeight: FontWeight.w400,
    );
  }

  getSmallTextStyleBlue() {
    return const TextStyle(
      color: ColorResources.lightBlue,
      fontFamily: Constants.fontRegular,
      fontSize: Dimensions.fontSmall,
      fontWeight: FontWeight.w400,
    );
  }

  getRegularTextStyle() {
    return const TextStyle(
      color: ColorResources.black,
      fontFamily: Constants.fontRegular,
      fontSize: Dimensions.fontRegular,
      fontWeight: FontWeight.w400,
    );
  }

  getRegularTextStyleWhite() {
    return const TextStyle(
      color: ColorResources.white,
      fontFamily: Constants.fontRegular,
      fontSize: Dimensions.fontRegular,
      fontWeight: FontWeight.w400,
    );
  }

  getRegularTextStyleBlue() {
    return const TextStyle(
      color: ColorResources.lightBlue,
      fontFamily: Constants.fontRegular,
      fontSize: Dimensions.fontRegular,
      fontWeight: FontWeight.w400,
    );
  }

  getMediumTextStyle() {
    return const TextStyle(
      color: ColorResources.black,
      fontFamily: Constants.fontMedium,
      fontSize: Dimensions.fontMedium,
      fontWeight: FontWeight.w500,
    );
  }

  getMediumTextStylePrimary() {
    return const TextStyle(
      color: ColorResources.primary,
      fontFamily: Constants.fontMedium,
      fontSize: Dimensions.fontMedium,
      fontWeight: FontWeight.w500,
    );
  }

  getMediumTextStyleBlue() {
    return const TextStyle(
      color: ColorResources.lightBlue,
      fontFamily: Constants.fontMedium,
      fontSize: Dimensions.fontMedium,
      fontWeight: FontWeight.w500,
    );
  }

  getBoldTextStyle() {
    return const TextStyle(
      color: ColorResources.black,
      fontFamily: Constants.fontBold,
      fontSize: Dimensions.fontBold,
      fontWeight: FontWeight.w700,
    );
  }

  getBoldTextStylePrimary() {
    return const TextStyle(
      color: ColorResources.primary,
      fontFamily: Constants.fontBold,
      fontSize: Dimensions.fontBold,
      fontWeight: FontWeight.w700,
    );
  }

  getBoldTextStyleBlue() {
    return const TextStyle(
      color: ColorResources.lightBlue,
      fontFamily: Constants.fontBold,
      fontSize: Dimensions.fontBold,
      fontWeight: FontWeight.w700,
    );
  }

  getHintTextStyle() {
    return const TextStyle(
      color: ColorResources.grey,
      fontFamily: Constants.fontRegular,
      fontSize: Dimensions.fontRegular,
      fontWeight: FontWeight.w400,
    );
  }

  getHorizontalSpacing() {
    if (util.isWebPlatform()) {
      return const SizedBox(
        width: Dimensions.defaultSpacingWidthWeb,
      );
    }
    return const SizedBox(
      width: Dimensions.defaultSpacingWidth,
    );
  }

  getSmallVerticalSpacing() {
    if (util.isWebPlatform()) {
      return const SizedBox(
        height: Dimensions.defaultSpacingHeightWeb,
      );
    }
    return const SizedBox(
      height: Dimensions.smallSpacingHeight,
    );
  }

  getVerticalSpacing() {
    if (util.isWebPlatform()) {
      return const SizedBox(
        height: Dimensions.defaultSpacingHeightWeb,
      );
    }
    return const SizedBox(
      height: Dimensions.defaultSpacingHeight,
    );
  }

  getVerticalDivider() {
    return const VerticalDivider(
      color: ColorResources.divider,
      thickness: 1,
    );
  }

  getAppBar(int selectedIndex, String? firstname) {
    String title = "";
    switch (selectedIndex) {
      case 0:
        title = MyAppLocalization.of(context)!.translate("dashboard");
        break;
      case 1:
        title = MyAppLocalization.of(context)!.translate("manage_accounts");
        break;
      case 2:
        title = MyAppLocalization.of(context)!.translate("suspended_accounts");
        break;
      case 3:
        title = MyAppLocalization.of(context)!.translate("deleted_accounts");
        break;
      case 4:
        title = MyAppLocalization.of(context)!.translate("manage_organizations");
        break;
      case 5:
        title = MyAppLocalization.of(context)!.translate("manage_organization_users");
        break;
    }

    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(
          left: Dimensions.marginLarge,
        ),
        child: getPngImage("ic_logo_white"),
      ),
      leadingWidth: 100,
      title: Text(
        title,
        style: getAppBarTextStyle(),
      ),
      actions: getActions(firstname),
    );
  }

  getActions(String? firstname) {
    return [
      PopupMenuButton(
          child: Padding(
            padding: const EdgeInsets.only(right: Dimensions.paddingDefault),
            child: Row(
              children: [
                firstname != null
                    ? Text(
                        "${MyAppLocalization.of(context)!.translate("welcome")}\n$firstname",
                        style: getRegularTextStyleBlue(),
                      )
                    : Text(
                        MyAppLocalization.of(context)!.translate("welcome"),
                        style: getRegularTextStyleBlue(),
                      ),
                getHorizontalSpacing(),
                getSvgImage("ic_down_arrow"),
              ],
            ),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text(
                  MyAppLocalization.of(context)!.translate("settings"),
                  style: getRegularTextStyle(),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  MyAppLocalization.of(context)!.translate("logout"),
                  style: getRegularTextStyle(),
                ),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 0) {
            } else if (value == 1) {
              util.logout();
            }
          }),
    ];
  }

  getSmallUserImage(String fileName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.cardRadiusRounded),
      child: Image(
        image: AssetImage("assets/jpeg/$fileName.jpeg"),
        fit: BoxFit.cover,
        height: Dimensions.imageHeight,
        width: Dimensions.imageWidth,
      ),
    );
  }

  getMediumUserImage(String fileName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.cardRadiusRounded),
      child: Image(
        image: AssetImage("assets/jpeg/$fileName.jpeg"),
        fit: BoxFit.cover,
        height: Dimensions.imageHeight * 1.3,
        width: Dimensions.imageWidth * 1.3,
      ),
    );
  }

  getUserImage(String fileName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.cardRadiusRounded),
      child: Image(
        image: AssetImage("assets/jpeg/$fileName.jpeg"),
        fit: BoxFit.cover,
        height: Dimensions.imageHeight * 2.2,
        width: Dimensions.imageWidth * 2.2,
      ),
    );
  }

  showProgress() {
    return showDialog(
      context: context,
      builder: (context) {
        return const SpinKitRotatingCircle(
          color: ColorResources.white,
        );
      },
    );
  }

  hideProgress() {
    Navigator.of(context).pop();
  }

  toast(String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: getRegularTextStyleBlue(),
        ),
      ),
    );
  }

  getProgress() {
    return const CircularProgressIndicator();
  }
}
