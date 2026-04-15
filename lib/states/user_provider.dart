import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/utils/logger.dart';

class UserProvider extends ChangeNotifier {



  UserProvider(){
    initUser();
  }

  User? _user;

  void initUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      logger.d('현재 유저 상태 $user');
      notifyListeners();
    },);
  }

  User? get user => _user;

// bool _userLoggedIn = true;
  //
  // void setUserAuth(bool authState){
  //   _userLoggedIn = authState;
  //   notifyListeners();
  // }
  //
  // bool get userState => _userLoggedIn;

}