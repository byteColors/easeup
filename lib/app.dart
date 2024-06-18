// Defining routes centrally

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
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const AuthModule(),
        '/dashboard': (context) => const DashboardModule(),
        '/eforms': (context) => const EFormsModule(),
        '/messaging': (context) => const MessagingModule(),
        '/payments': (context) => const PaymentsModule(),
        '/receipts': (context) => const ReceiptsModule(),
      },
    );
  }
}
