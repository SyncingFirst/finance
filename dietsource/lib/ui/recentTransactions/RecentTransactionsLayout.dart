import 'package:dietsource/utils/CommonComponents.dart';
import 'package:flutter/material.dart';

class RecentTransactionsLayout extends StatelessWidget {
  final CommonComponents commonComponents;
  final Widget title;
  final Widget seeAll;
  final Widget transactionType;
  final Widget transactionDate;
  final Widget transactions;
  final Widget transactionsDoneWith;
  final Widget seeDetailsBtn;

  const RecentTransactionsLayout({
    super.key,
    required this.commonComponents,
    required this.title,
    required this.seeAll,
    required this.transactionType,
    required this.transactionDate,
    required this.transactions,
    required this.transactionsDoneWith,
    required this.seeDetailsBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
