import 'package:easeup/modules/dashboard/viewmodels/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/dashboard_screen.dart';

class DashboardModule extends StatelessWidget {
  const DashboardModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        routes: {
          'dashboard': (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
