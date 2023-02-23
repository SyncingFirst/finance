import 'package:dietsource/utils/CommonComponents.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final CommonComponents commonComponents;
  final Widget userDetails;
  final Widget overview;
  final Widget date;
  final Widget transactionList;

  const HomeLayout({
    super.key,
    required this.commonComponents,
    required this.userDetails,
    required this.overview,
    required this.date,
    required this.transactionList,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
