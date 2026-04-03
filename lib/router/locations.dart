import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/screens/start_screen.dart';
import 'package:practice/screens/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable<dynamic> state,
  ) {
    return [
      BeamPage(child: HomeScreen(), key: ValueKey('home')),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}
