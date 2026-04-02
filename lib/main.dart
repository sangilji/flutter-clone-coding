import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:practice/router/locations.dart';
import 'package:practice/screens/home_screen.dart';
import 'package:practice/screens/splash_screen.dart';

final _routerDelegate = BeamerDelegate(
  locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]),
);

void main() {
  runApp(Myapp());
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
      return RadishApp();
    } else {
      return SplashScreen();
    }
  }
}

class RadishApp extends StatelessWidget {
  const RadishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
