import 'package:dietsource/ui/recentTransactions/RecentTransactionsLayout.dart';
import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class RecentTransactionsSmallScreenLayout extends RecentTransactionsLayout {
  const RecentTransactionsSmallScreenLayout(
      {super.key,
      required super.commonComponents,
      required super.title,
      required super.seeAll,
      required super.transactionType,
      required super.transactionDate,
      required super.transactions,
      required super.transactionsDoneWith,
      required super.seeDetailsBtn});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title,
              seeAll,
            ],
          ),
          commonComponents.getVerticalSpacing(),
          transactionType,
          commonComponents.getVerticalSpacing(),
          transactionDate,
          commonComponents.getVerticalSpacing(),
          transactions,
          commonComponents.getVerticalSpacing(),
          transactionsDoneWith,
          commonComponents.getVerticalSpacing(),
          seeDetailsBtn,
        ],
      ),
    );
  }
}
