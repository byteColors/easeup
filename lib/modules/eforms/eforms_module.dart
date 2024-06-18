import 'package:easeup/modules/eforms/viewmodels/eforms_viewmodel.dart';
import 'package:easeup/modules/eforms/views/eforms_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EFormsModule extends StatelessWidget {
  const EFormsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EFormsViewModel()),
      ],
      child: MaterialApp(
        routes: {
          '/eforms': (context) => const EformsScreen(),
        },
      ),
    );
  }
}
