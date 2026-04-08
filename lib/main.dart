import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/screens/home_screen.dart';
import 'package:practice/screens/splash_screen.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:practice/screens/start_screen.dart';
import 'package:practice/states/user_provider.dart';
import 'package:provider/provider.dart';

final UserProvider userProvider = UserProvider();

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => StartScreen(),
    ),
  ],
  refreshListenable: userProvider,
  redirect: (context, state) {
    final loggedIn = userProvider.userState;
    final goingToLogin = state.uri.toString() == '/login';

    if (!loggedIn && !goingToLogin) {
      return '/login';
    }

    if (loggedIn && goingToLogin) {
      return '/';
    }

    return null;
  },
);

// final _routerDelegate = BeamerDelegate(
//   guards: [
//     BeamGuard(
//       pathPatterns: ['/'],
//       check: (context, location) {
//         return context
//             .watch<UserProvider>()
//             .userState;
//       },
//       // showPage: BeamPage(child: StartScreen()),
//       beamToNamed: (origin, target) => '/login',
//     ),
//   ],
//
//   locationBuilder: BeamerLocationBuilder(
//     beamLocations: [HomeLocation(), AuthLocation()],
//   ).call,
// );

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: Duration(microseconds: 900),
          child: _splashLoadingWidget(snapshot),
        );
      },
    );
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print('error');
      return Text('error');
    } else if (snapshot.connectionState == ConnectionState.done) {
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
    return ChangeNotifierProvider.value(
      value: userProvider,
      child: MaterialApp.router(
        theme: ThemeData(
          hintColor: Colors.grey[350],
          // fontFamily: 'RiiCookie',
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.deepOrange,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              minimumSize: Size(48, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.deepOrange,
          ),
          textTheme: TextTheme(
            // headlineMedium: TextStyle(fontFamily: 'RiiCookie'),
            labelLarge: TextStyle(color: Colors.white),
            titleSmall:TextStyle(fontSize: 13,color: Colors.black38),
            titleMedium:TextStyle(fontSize: 20,color: Colors.black87),

          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w700),
            elevation: 2,
            actionsIconTheme: IconThemeData(color: Colors.black),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.black38,
          )
        ),
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
