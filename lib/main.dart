import 'package:flutter/material.dart';

void main() {
  runApp(const TikTokAPP());
}

class TikTokAPP extends StatelessWidget {
  const TikTokAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTokClone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
