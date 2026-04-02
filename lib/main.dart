import 'package:flutter/material.dart';
import 'package:practice/home_screen.dart';
import 'package:practice/splash_screen.dart';

void main() {
  runApp(Myapp()); // ① SplashScreen 위젯을 첫 화면으로 지정
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: Future.delayed(Duration(seconds: 3), () => 100),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: Duration(microseconds: 900),
          child: _splashLoadingWidget(snapshot),
        );
      },
    );

  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object> snapshot) {
    if (snapshot.hasError) {
      print('error');
      return Text('error');
    } else if (snapshot.hasData) {
      return HomeScreen();
    } else{
      return SplashScreen();
    }

  }
}


