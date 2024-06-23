import 'package:easeup/core/navigation/routes_name.dart';
import 'package:easeup/modules/authentication/viewmodels/authentication_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, this.currentUser});

  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthenticationViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: const Text('easeup dashboard'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton.outlined(
              onPressed: () {
                final viewModel = Provider.of<AuthenticationViewModel>(
                  context,
                  listen: false,
                );
                viewModel.logout();

                if (true) {
                  if (!context.mounted) return;
                  Navigator.pushNamed(context, RoutesName.login);
                }
              },
              icon: const Icon(
                Icons.logout_outlined,
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // TODO: Implement Exception if currentUser is Null
              'Welcome \n${viewModel.currentUser!.email.toString()} \nease up!',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const Text('Xplore More...'),
          ],
        ),
      ),
    );
  }
}
