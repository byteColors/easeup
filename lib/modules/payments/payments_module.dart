import 'package:easeup/modules/payments/viewmodels/payments_viewmodel.dart';
import 'package:easeup/modules/payments/views/payments_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentsModule extends StatelessWidget {
  const PaymentsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentsViewModel()),
      ],
      child: MaterialApp(
        routes: {
          '/payments': (context) => const PaymentsScreen(),
        },
      ),
    );
  }
}
