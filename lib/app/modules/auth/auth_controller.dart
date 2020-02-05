import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {
  final SharedPreferences shared;
  _AuthBase(this.shared);
  @observable
  String email = "";
  @observable
  String senha = "";

  @action
  void setEmail(String _email) => email = _email;

  @action
  void setSenha(String _senha) => senha = _senha;

  @action
  Future<bool> login() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    ))
        .user;

    var tokenId = await user.getIdToken();
    var valid = tokenId != null;

    if (valid) {
      shared.setString("token", tokenId.token);
    }

    return valid;
  }
}
