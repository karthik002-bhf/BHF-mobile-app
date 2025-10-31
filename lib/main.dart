import 'package:bhf_mobile_app/screens/bottom_nav_screen.dart';
// import 'package:bhf_mobile_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// const Color kPrimaryBg = Color(0xFF1a3136); // deep teal - main bg
// const Color kCardPanel = Color(0xFF748183); // desaturated steel - card/panel
// const Color kSecondaryBg = Color(0xFFbd9063); // warm tan - secondary bg/chips
// const Color kAccentBrown = Color(0xFF87603b); // brown - card accent/icons
// const Color kMutedText = Color(0xFFd1c1ab); // soft beige - muted, tags
// const Color kHighlightCTA = Color(0xFFc26d2d);

// final ColorScheme customLightScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: kPrimaryBg, // Navy blue
//   // primary: Color(0xFF174378), // Navy blue
//   onPrimary: Colors.white,
//   secondary: kSecondaryBg, // Amber/Orange
//   // secondary: Color(0xFFFFA000), // Amber/Orange
//   onSecondary: Colors.white,
//   tertiary: kAccentBrown, // Rust
//   // tertiary: Color(0xFFB44B23), // Rust
//   onTertiary: Colors.white,
//   error: Colors.red.shade700,
//   onError: Colors.white,
//   background: kPrimaryBg, // Light grey
//   // background: Color(0xFFF3F6F9), // Light grey
//   onBackground: Color(0xFF333739), // Text color
//   surface: kCardPanel,
//   // surface: Color(0xFFFCFCFF),
//   onSurface: Color(0xFF333739),
// );

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: kColorScheme,
  // textTheme: GoogleFonts.latoTextTheme(),
  // textTheme: TextTheme(
  //   bodyLarge: TextStyle(color: kMutedText),
  //   bodyMedium: TextStyle(color: kMutedText),
  // ),
  fontFamily: 'Roboto',
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: kHighlightCTA,
  //     foregroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //   ),
  // ),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BottomNavScreen());
    // return MaterialApp(home: HomeScreen());
  }
}
