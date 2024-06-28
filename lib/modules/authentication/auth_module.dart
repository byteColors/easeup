import 'package:easeup/core/navigation/routes_name.dart';
import 'package:easeup/modules/authentication/viewmodels/authentication_viewmodel.dart';
import 'package:easeup/modules/dashboard/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'views/login_screen.dart';
import 'package:provider/provider.dart';

class AuthModule extends StatelessWidget {
  const AuthModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
      ],
      // child: const LoginScreen(),

      // Handling Auth Guard and Initialization by adding logic to guard
      // certain routes based on the authentication state
      child: Consumer<AuthenticationViewModel>(
        builder: (context, authViewModel, child) {
          if (authViewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Ensure context.mounted is checked before using Navigator
          if (!context.mounted) {
            return Container(); // Or an empty widget to avoid navigation issues
          }

          // Navigation Delegate Approach
          return Navigator(
            initialRoute: authViewModel.currentUser == null
                ? RoutesName.login
                : RoutesName.dashboard,
            onGenerateRoute: (RouteSettings routeSetting) {
              switch (routeSetting.name) {
                case RoutesName.login:
                  return MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  );
                case RoutesName.dashboard:
                  return MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  );
                // Add other cases here for different routes if needed
                default:
                  return MaterialPageRoute(
                    builder: (context) => const Scaffold(
                      body: Center(
                        child: Text('No route defined.'),
                      ),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
