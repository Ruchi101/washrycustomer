
import 'package:flutter/material.dart';
import 'package:washrycustomer/ui/view/dashboardV.dart';
import 'package:washrycustomer/ui/view/loginV.dart';
import 'package:washrycustomer/ui/view/pricelist.dart';
import 'package:washrycustomer/ui/view/vendorlistV.dart';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginV());
      case '/dashboard':
        return MaterialPageRoute(builder: (context) => DashboardV());
      case '/vendorlist' :
        return MaterialPageRoute(builder: (context) => VendorListV());
      case '/pricelist' :
        return MaterialPageRoute(builder: (context) => PriceListScreen());
    }
  }
}
