import 'package:dietsource/routes/RouteConstants.dart';
import 'package:dietsource/ui/home/Home.dart';
import 'package:dietsource/ui/login/Login.dart';
import 'package:dietsource/ui/recentTransactions/RecentTransactions.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: RouteConstants().loginPage, page: () => const Login()),
    GetPage(name: RouteConstants().homePage, page: () => const Home()),
    GetPage(name: RouteConstants().recentTransactionsPage, page: () => const RecentTransactions()),
  ];
}
