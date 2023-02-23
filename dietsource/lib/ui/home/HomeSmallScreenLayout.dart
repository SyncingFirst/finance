import 'package:dietsource/ui/home/HomeLayout.dart';
import 'package:flutter/material.dart';

import '../../utils/Colors.dart';
import '../../utils/Dimensions.dart';

class HomeSmallScreenLayout extends HomeLayout {
  const HomeSmallScreenLayout(
      {super.key,
      required super.commonComponents,
      required super.userDetails,
      required super.overview,
      required super.date,
      required super.transactionList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResources.bg,
      padding: const EdgeInsets.fromLTRB(
        Dimensions.paddingLarge,
        Dimensions.paddingDefault,
        Dimensions.paddingLarge,
        Dimensions.paddingDefault,
      ),
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          userDetails,
          commonComponents.getVerticalSpacing(),
          commonComponents.getSmallVerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              overview,
              date,
            ],
          ),
          commonComponents.getVerticalSpacing(),
          commonComponents.getSmallVerticalSpacing(),
          transactionList,
        ],
      ),
    );
  }
}
