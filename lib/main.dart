import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/splash_sreen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    FlutterCakeShopApp(),
  );
}

class FlutterCakeShopApp extends StatefulWidget {
  const FlutterCakeShopApp({super.key});

  @override
  State<FlutterCakeShopApp> createState() => _FlutterCakeShopAppState();
}

class _FlutterCakeShopAppState extends State<FlutterCakeShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenUI(),
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: GoogleFonts.kanit().fontFamily,
          fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback,
        ),
      ),
    );
  }
}
