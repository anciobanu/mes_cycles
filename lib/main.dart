import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mes_cycles/src/screen/home.dart';



void main() {
  runApp(MesCycles());
}

class MesCycles extends StatelessWidget {
  MesCycles({super.key});

  final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.pink, brightness: Brightness.light,);
  final darkColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark,);
  final textTheme = ThemeData().textTheme.copyWith(
    titleLarge: GoogleFonts.quicksand().copyWith(fontSize: 24, fontWeight: FontWeight.bold,),
    titleMedium: GoogleFonts.quicksand().copyWith(fontSize: 20, fontWeight: FontWeight.bold,),
    bodyLarge: GoogleFonts.quicksand().copyWith(fontSize: 18,),
    bodyMedium: GoogleFonts.quicksand().copyWith(fontSize: 16,),
    bodySmall: GoogleFonts.quicksand().copyWith(fontSize: 14,),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        textTheme: textTheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: darkColorScheme.primary,
          shadowColor: darkColorScheme.primary,
          elevation: 5,
          titleTextStyle: const TextStyle().copyWith(
            color: darkColorScheme.onPrimary,
          ),
          iconTheme: const IconThemeData().copyWith(
            color: darkColorScheme.onPrimary,
          ),
        ),
        tabBarTheme: const TabBarTheme().copyWith(
          tabAlignment: TabAlignment.fill,
          labelColor: darkColorScheme.secondaryContainer,
          unselectedLabelColor: darkColorScheme.onSecondary,
          indicatorColor: darkColorScheme.secondaryContainer,
          dividerColor: darkColorScheme.secondary,
        ),
        navigationRailTheme: const NavigationRailThemeData().copyWith(
          backgroundColor: darkColorScheme.primary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: darkColorScheme.secondaryContainer,
        ),
        // A voir ce que ça fait ça en dessous ...
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: lightColorScheme.primary,
          shadowColor: lightColorScheme.primary,
          elevation: 5,
          titleTextStyle: const TextStyle().copyWith(
            color: lightColorScheme.onPrimary,
          ),
          iconTheme: const IconThemeData().copyWith(
            color: lightColorScheme.onPrimary,
          ),
        ),
        tabBarTheme: const TabBarTheme().copyWith(
          tabAlignment: TabAlignment.fill,
          labelColor: lightColorScheme.secondaryContainer,
          unselectedLabelColor: lightColorScheme.onSecondary,
          indicatorColor: lightColorScheme.secondaryContainer,
          dividerColor: lightColorScheme.secondary,
        ),
        navigationRailTheme: const NavigationRailThemeData().copyWith(
          backgroundColor: lightColorScheme.primary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: lightColorScheme.secondaryContainer,
        ),
        // A voir ce que ça fait ça en dessous ...
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      themeMode: ThemeMode.system,
      title: 'Mes Cycles',
      home: const Home(),
    );
  }
}