import 'package:flutter/material.dart';
import 'package:practice/screens/start/intro_page.dart';

class AuthScreen extends StatefulWidget {

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          IntroPage(_pageController),
          Container(color: Colors.accents[2]),
          Container(color: Colors.accents[5]),
        ],
      ),
    );
  }
}
