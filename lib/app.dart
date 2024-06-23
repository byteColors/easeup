// Defining routes centrally

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easeup/core/navigation/routes.dart';
import 'package:easeup/core/navigation/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.playpenSansTextTheme(),
      ),
      title: "easeup app",
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
