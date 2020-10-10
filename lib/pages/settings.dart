import 'dart:math';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final Color backgroundColor = Color(0xFF1D1E18);
  final Color letterColor = Color(0xFFFEFEFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Text('settings.dart'),
      ),
    );
  }
}
