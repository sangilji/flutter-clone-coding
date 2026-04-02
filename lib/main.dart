import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:practice/router/auth_location.dart';
import 'package:practice/router/locations.dart';
import 'package:practice/screens/splash_screen.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

final _routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {
        return false;
      } ,
      beamToNamed: (origin, target) => '/login',
    ),
  ],

  locationBuilder: BeamerLocationBuilder(
    beamLocations: [HomeLocation(), AuthLocation()],
  ).call,
);

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: Future.delayed(Duration(seconds: 1), () => 100),
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
      theme: ThemeData(
        hintColor: Colors.grey[350],
        fontFamily: 'RiiCookie',
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.deepOrange,
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontFamily: 'RiiCookie'),
          labelLarge: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
