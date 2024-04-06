import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.blueGrey[300],
    colorScheme: ColorScheme.light(
      primary: Colors.blueGrey[300]!,
      secondary: Colors.cyan[600]!,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[300],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      buttonColor: Colors.cyan[600],
    ),

    // Text Theme
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Colors.black87, fontSize: 16.0),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 14.0),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey[900],
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey[900]!,
      secondary: Colors.tealAccent[700]!,
      onPrimary: Colors.tealAccent[700]!,
      surface: Color(0xFF121212),
      onSurface: Colors.white70,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[900],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.tealAccent[700]),
      titleTextStyle: TextStyle(
          color: Colors.tealAccent[700],
          fontSize: 20.0,
          fontWeight: FontWeight.bold),
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      buttonColor: Colors.tealAccent[700],
    ),

    // Text Theme
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Colors.white70, fontSize: 16.0),
      bodyMedium: TextStyle(color: Colors.white60, fontSize: 14.0),
    ),
  );
}
