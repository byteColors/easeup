import 'package:easeup/modules/receipts/viewmodels/receipts_viewmodel.dart';
import 'package:easeup/modules/receipts/views/receipts_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiptsModule extends StatelessWidget {
  const ReceiptsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReceiptsViewModels()),
      ],
      child: MaterialApp(
        routes: {
          '/receipts': (context) => const ReceiptsScreen(),
        },
      ),
    );
  }
}
