// Defining routes centrally

import 'package:easeup/core/navigation/routes.dart';
import 'package:easeup/core/navigation/routes_name.dart';
import 'package:flutter/material.dart';
import 'modules/authentication/auth_module.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/payments/payments_module.dart';
import 'modules/receipts/receipts_module.dart';
import 'modules/eforms/eforms_module.dart';
import 'modules/messaging/messaging_module.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "easeup app",
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
