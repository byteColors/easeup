// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'views/login_screen.dart';
import 'viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthModule extends StatelessWidget {
  const AuthModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ]);
  }
}
