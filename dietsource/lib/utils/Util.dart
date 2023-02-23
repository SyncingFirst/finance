import 'dart:core';

import 'package:dietsource/localization/MyAppLocalization.dart';
import 'package:dietsource/routes/RouteConstants.dart';
import 'package:dietsource/utils/Constants.dart';
import 'package:dietsource/utils/Preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpolation/interpolation.dart';
import 'package:intl/intl.dart';

class Util {
  static const bool showLogs = true;
  Preferences preferences = Preferences();
  Interpolation interpolation = Interpolation();

  isWebPlatform() {
    if (kIsWeb) {
      return true;
    }
    return false;
  }

  getJwtToken() {
    if (preferences.getValue(Preferences.jwtToken) != null) {
      return preferences.getValue(Preferences.jwtToken);
    }
    return "";
  }

  validateMobileNumber(String text) {
    if (text.length == 10) {
      return true;
    }
    return false;
  }

  validateShortCode(String text) {
    if (text.length == 6) {
      return true;
    }
    return false;
  }

  logout() {
    preferences.clear();
    Get.offAllNamed(RouteConstants().loginPage);
  }

  interpolateText(BuildContext context, String tag, String data) {
    String text = MyAppLocalization.of(context)!.translate(tag);
    Map newText = {'0': data ?? ""};
    return interpolation.eval(text, newText);
  }

  String convertToSince(String timestamp) {
    var fmt = DateFormat(Constants.dateTimeFormat);
    var serverDate = fmt.format(DateTime.parse(timestamp));
    var date = fmt.parse(serverDate, true).toLocal();
    return DateFormat.yMMM().format(date);
  }
}
