import 'package:dietsource/localization/MyAppLocalization.dart';
import 'package:dietsource/models/request/SampleTransactionsDtoModel.dart';
import 'package:dietsource/ui/custom/CustomAppBar.dart';
import 'package:dietsource/ui/custom/CustomButton.dart';
import 'package:dietsource/ui/custom/CustomToggleButton.dart';
import 'package:dietsource/ui/recentTransactions/RecentTransactionsSmallScreenLayout.dart';
import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Constants.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  CommonComponents commonComponents = CommonComponents();

  int selectedTransactionTypeIndex = 0;

  final List<String> transactionTypeList = [];
  SampleTransactionsDtoModel model = SampleTransactionsDtoModel();

  @override
  void initState() {
    super.initState();
    commonComponents.setContext(context);
    loadTransactionType();
    loadSampleTransactions();
  }

  loadTransactionType() {
    transactionTypeList.add("All");
    transactionTypeList.add("Income");
    transactionTypeList.add("Expenses");
  }

  loadSampleTransactions() {
    List<Transactions>? transactions = [];

    Transactions item1 = Transactions();
    item1.amount = "30.00";
    item1.type = "Payment";
    item1.description = "Payment from Andrea";
    transactions.add(item1);

    model.transactions = transactions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "",
            hasBackIcon: true,
            hasSearchIcon: true,
            onBackTap: () {
              Get.back();
            },
            onSearchTap: () {},
          ),
          RecentTransactionsSmallScreenLayout(
            commonComponents: commonComponents,
            title: title(),
            seeAll: seeAll(),
            transactionType: transactionType(),
            transactionDate: transactionDate(),
            transactions: transactions(),
            transactionsDoneWith: transactionsDoneWith(),
            seeDetailsBtn: seeDetailsBtn(),
          ),
        ],
      ),
    );
  }

  title() {
    return Text(
      MyAppLocalization.of(context)!.translate("recent.transactions"),
      style: commonComponents.getBoldTextStyle(),
    );
  }

  seeAll() {
    return InkWell(
      child: Text(
        MyAppLocalization.of(context)!.translate("see.all"),
        style: commonComponents.getRegularTextStyleBlue(),
      ),
      onTap: () {},
    );
  }

  transactionType() {
    if (transactionTypeList.isNotEmpty) {
      return CustomToggleButton(
        list: transactionTypeList,
        selectedIndex: selectedTransactionTypeIndex,
        onTap: onTap,
      );
    }
    return Container();
  }

  onTap(int selectedIndex) {
    setState(() {
      selectedTransactionTypeIndex = selectedIndex;
    });
  }

  transactionDate() {
    return Text(
      MyAppLocalization.of(context)!.translate("today"),
      style: commonComponents.getMediumTextStyle(),
    );
  }

  transactions() {
    if (model.transactions != null && model.transactions!.isNotEmpty) {
      return ListView.builder(
        itemCount: model.transactions!.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return getTransactionCard(model.transactions![index]);
        },
      );
    }
    return Container();
  }

  getTransactionCard(Transactions item) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: Dimensions.marginDefault,
      ),
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
        child: Row(
          children: [
            const Icon(Icons.email),
            commonComponents.getHorizontalSpacing(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.type!,
                    style: commonComponents.getMediumTextStyle(),
                  ),
                  commonComponents.getSmallVerticalSpacing(),
                  Text(
                    item.description!,
                    style: commonComponents.getHintTextStyle(),
                  ),
                ],
              ),
            ),
            commonComponents.getHorizontalSpacing(),
            Text(
              MyAppLocalization.of(context)!.translate("\$") + item.amount!,
              style: commonComponents.getRegularTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  transactionsDoneWith() {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          const Image(
            image: AssetImage("assets/jpeg/ic_circles.jpeg"),
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            top: 80,
            left: MediaQuery.of(context).size.width / 2.75,
            child: commonComponents.getMediumUserImage("ic_user"),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2.65,
            child: commonComponents.getSmallUserImage("ic_user"),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 6,
            child: commonComponents.getSmallUserImage("ic_user"),
          ),
          Positioned(
            top: 60,
            right: MediaQuery.of(context).size.width / 6,
            child: commonComponents.getSmallUserImage("ic_user"),
          ),
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width / 6,
            child: commonComponents.getSmallUserImage("ic_user"),
          ),
          Positioned(
            top: 150,
            right: MediaQuery.of(context).size.width / 6,
            child: commonComponents.getSmallUserImage("ic_user"),
          ),
        ],
      ),
    );
  }

  seeDetailsBtn() {
    return CustomButton(
      text: MyAppLocalization.of(context)!.translate("see.details"),
      onPressed: () {},
    );
  }
}
