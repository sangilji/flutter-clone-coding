import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/screens/auth_screen.dart';
import 'package:practice/screens/home_screen.dart';

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable<dynamic> state,
  ) {
    return [
      BeamPage(child: AuthScreen(), key: ValueKey('login')),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/login'];
}
