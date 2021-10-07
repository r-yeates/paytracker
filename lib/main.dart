import 'package:PayTrackr/config/theme.dart';
import 'package:PayTrackr/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PayTrackr());
}

class PayTrackr extends StatelessWidget {
  const PayTrackr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Title to identify the app for the user
      title: 'PayTrackr',
      theme: themeDark,
      home: const Home(),
    );
  }
}
