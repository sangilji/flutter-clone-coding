import 'package:flutter/material.dart';
import 'package:practice/screens/start/address_page.dart';
import 'package:practice/screens/start/auth_page.dart';
import 'package:practice/screens/start/intro_page.dart';

class StartScreen extends StatefulWidget {

  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          IntroPage(_pageController),
          AddressPage(_pageController),
          AuthPage(),
        ],
      ),
    );
  }
}
