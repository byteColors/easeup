import 'package:easeup/core/navigation/routes_name.dart';
import 'package:easeup/modules/authentication/views/login_screen.dart';
import 'package:easeup/modules/dashboard/views/dashboard_screen.dart';
import 'package:easeup/modules/eforms/views/eforms_screen.dart';
import 'package:easeup/modules/messaging/views/messaging_screen.dart';
import 'package:easeup/modules/payments/views/payments_screen.dart';
import 'package:easeup/modules/receipts/views/receipts_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesName.dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      case RoutesName.eforms:
        return MaterialPageRoute(
          builder: (context) => const EformsScreen(),
        );
      case RoutesName.messaging:
        return MaterialPageRoute(
          builder: (context) => const MessagingScreen(),
        );
      case RoutesName.payments:
        return MaterialPageRoute(
          builder: (context) => const PaymentsScreen(),
        );
      case RoutesName.receipts:
        return MaterialPageRoute(
          builder: (context) => const ReceiptsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route defined.'),
            ),
          ),
        );
    }
  }
}
