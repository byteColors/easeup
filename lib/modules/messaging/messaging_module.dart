import 'package:easeup/modules/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:easeup/modules/messaging/views/messaging_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagingModule extends StatelessWidget {
  const MessagingModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MessagingViewModel()),
      ],
      child: MaterialApp(
        routes: {
          '/messaging': (context) => const MessagingScreen(),
        },
      ),
    );
  }
}
