import 'package:flutter/material.dart';
import 'package:password_manager_app/screens/generator.dart';

void main() {
  runApp(PasswordManagerApp());
}

class PasswordManagerApp extends StatelessWidget {
  PasswordManagerApp({Key? key}) : super(key: key);

  final Color backgroundColor = Color(toHex('#262626'));
  final Color accentColor = Color(toHex('#c59931'));
  final Color primaryColor = Color(toHex('#6f55c7'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: this.accentColor,
        backgroundColor: this.backgroundColor,
        primaryColor: this.primaryColor,
      ),
      home: Scaffold(
        body: SafeArea(
          child: PasswordGeneratorScreen(),
        ),
        backgroundColor: this.backgroundColor,
      ),
      color: this.backgroundColor,
    );
  }
}

int toHex(String hexcode) {
  String hexstring = hexcode;
  return int.parse(hexstring.replaceFirst('#', '0xFF'));
}
