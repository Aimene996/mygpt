import 'package:flutter/material.dart';
import 'package:mygpt/features/config/theme.dart';
import 'package:mygpt/presentations/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Pallete.whiteColor,
          appBarTheme: const AppBarTheme(backgroundColor: Pallete.whiteColor)),
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
