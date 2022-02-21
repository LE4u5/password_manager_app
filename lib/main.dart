import 'package:flutter/material.dart';
import 'package:password_manager_app/screens/generator.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(PasswordManagerApp());
}

class PasswordManagerApp extends StatelessWidget {
  PasswordManagerApp({Key? key}) : super(key: key);

  final Color backgroundColor = Color(toHex('#262626'));
  final Color accentColor = Color(toHex('#c59931'));
  final Color primaryColor = Color(toHex('#6f55c7'));
  final Color secondaryBackgroundColor = Color(toHex('#3a3a3a'));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevDav Password Manager',
      theme: ThemeData(
        cardColor: this.secondaryBackgroundColor,
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
