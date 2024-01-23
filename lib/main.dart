import 'package:flutter/material.dart';
import 'package:flutter_chatapp/screens/screens.dart';
import 'package:flutter_chatapp/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Chatter',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
