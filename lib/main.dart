import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:past_list/config/colors.dart';
import 'package:past_list/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Past List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}

final ThemeData kAppThemeData = _buildAppTheme();

ThemeData _buildAppTheme() {
  final baseTheme = ThemeData.light();
  final baseTextTheme = GoogleFonts.poppinsTextTheme(baseTheme.textTheme);
  return baseTheme.copyWith(
    scaffoldBackgroundColor: kWhite,
    textTheme: baseTextTheme.copyWith(

      // Titulo
      displayLarge: baseTextTheme.displayLarge!.copyWith(
        height: 58.5 / 39.0,
        fontWeight: FontWeight.w700,
        fontSize: 39.0,
        color: kBlack
      ),
      
      // H1
      displayMedium: baseTextTheme.displayMedium!.copyWith(
        height: 46.88 / 31.25,
        fontWeight: FontWeight.w700,
        fontSize: 31.25,
        color: kBlack
      ),

      // H2
      displaySmall: baseTextTheme.displaySmall!.copyWith(
        height: 37.5 / 25.0,
        fontWeight: FontWeight.w400,
        fontSize: 25.0,
        color: kBlack
      ),

      // H3, Button Large
      headlineSmall: baseTextTheme.headlineSmall!.copyWith(
        height: 20.0 / 20.0,
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
        color: kBlack
      ),

      // Body Regular
      bodyLarge: baseTextTheme.bodyLarge!.copyWith(
        fontSize: 14.0,
        color: kBlack
      ),

      // Body Regular
      bodySmall: baseTextTheme.bodySmall!.copyWith(
        height: 21.0 / 14.0,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: kBlack
      ),

      // Caption
      labelSmall: baseTextTheme.labelSmall!.copyWith(
        height: 19.2 / 12.8,
        fontWeight: FontWeight.w400,
        fontSize: 12.8,
        color: kCaption
      ),
    ),
  );
}