import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashBase with _$SplashController;

abstract class _SplashBase with Store {
  final FirebaseAuth firebaseAuth;

  _SplashBase(this.firebaseAuth);

  Future<bool> checkLogin() async {
    var user = await firebaseAuth.currentUser();
    return user != null;
  }
}
