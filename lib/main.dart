import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:password_generator/Pages/Dashboard.dart';
import 'package:password_generator/Pages/Login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const MyApp(key: Key('app'),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "RRHH Management",
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ] ,
        supportedLocales: const [
          Locale('es'),
          Locale('en')
        ],
        locale: const Locale('es'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
          '/': (context) => const Login(key: Key('login')),
          '/dashboard': (context)=> const  Dashboard(key:Key('dashboard')),
      },
    );
  }
}

