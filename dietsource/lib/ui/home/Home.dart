import 'package:dietsource/localization/MyAppLocalization.dart';
import 'package:dietsource/models/request/SampleTransactionsDtoModel.dart';
import 'package:dietsource/routes/RouteConstants.dart';
import 'package:dietsource/ui/home/HomeSmallScreenLayout.dart';
import 'package:dietsource/utils/CommonComponents.dart';
import 'package:dietsource/utils/Constants.dart';
import 'package:dietsource/utils/Dimensions.dart';
import 'package:dietsource/utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CommonComponents commonComponents = CommonComponents();
  Util util = Util();

  SampleTransactionsDtoModel model = SampleTransactionsDtoModel();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    commonComponents.setContext(context);
    loadSampleTransactions();
  }

  loadSampleTransactions() {
    List<Transactions>? transactions = [];

    Transactions item1 = Transactions();
    item1.amount = "150";
    item1.type = Constants.transactionTypeSent;
    item1.description = "Sending Payment to Clients";
    transactions.add(item1);

    Transactions item2 = Transactions();
    item2.amount = "250";
    item2.type = Constants.transactionTypeReceive;
    item2.description = "Receiving Salary from company";
    transactions.add(item2);

    Transactions item3 = Transactions();
    item3.amount = "400";
    item3.type = Constants.transactionTypeLoan;
    item3.description = "Loan for the Car";
    transactions.add(item3);

    model.transactions = transactions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeSmallScreenLayout(
        commonComponents: commonComponents,
        userDetails: userDetails(),
        overview: overview(),
        date: date(),
        transactionList: transactionList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Pay",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: "Payments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 25,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }

  userDetails() {
    return InkWell(
      child: Card(
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonComponents.getPngImage("ic_drawer"),
                  commonComponents.getPngImage("ic_two_dots"),
                ],
              ),
              commonComponents.getVerticalSpacing(),
              commonComponents.getUserImage("ic_user"),
              commonComponents.getVerticalSpacing(),
              Text(
                "Hira Riaz",
                style: commonComponents.getBoldTextStylePrimary(),
              ),
              commonComponents.getSmallVerticalSpacing(),
              Text(
                "UX/UI Designer",
                style: commonComponents.getSmallTextStylePrimary(),
              ),
              commonComponents.getVerticalSpacing(),
              commonComponents.getVerticalSpacing(),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getAmounts("8900", MyAppLocalization.of(context)!.translate("income")),
                    commonComponents.getVerticalDivider(),
                    getAmounts("5500", MyAppLocalization.of(context)!.translate("expenses")),
                    commonComponents.getVerticalDivider(),
                    getAmounts("890", MyAppLocalization.of(context)!.translate("loan")),
                  ],
                ),
              ),
              commonComponents.getVerticalSpacing(),
              commonComponents.getVerticalSpacing(),
            ],
          ),
        ),
      ),
      onTap: () {
        Get.toNamed(RouteConstants().recentTransactionsPage);
      },
    );
  }

  getAmounts(String amount, String title) {
    return Column(
      children: [
        Text(
          MyAppLocalization.of(context)!.translate("\$") + amount,
          style: commonComponents.getMediumTextStyleBlue(),
        ),
        commonComponents.getSmallVerticalSpacing(),
        Text(
          title,
          style: commonComponents.getRegularTextStyleBlue(),
        ),
      ],
    );
  }

  overview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          MyAppLocalization.of(context)!.translate("overview"),
          style: commonComponents.getBoldTextStylePrimary(),
        ),
        const Icon(Icons.notifications_outlined),
      ],
    );
  }

  date() {
    return Text(
      MyAppLocalization.of(context)!.translate("date"),
      style: commonComponents.getMediumTextStylePrimary(),
    );
  }

  transactionList() {
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
            item.type == Constants.transactionTypeSent
                ? const Icon(Icons.arrow_upward)
                : item.type == Constants.transactionTypeReceive
                    ? const Icon(Icons.arrow_downward)
                    : const Icon(Icons.pending),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
