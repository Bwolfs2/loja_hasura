import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {
  @observable
  String email = "";
  @observable
  String senha = "";

  @observable
  String emailError;
  @observable
  String senhaError;

  @action
  void setEmail(String _email) => email = _email;

  @action
  void setSenha(String _senha) => senha = _senha;

  @action
  Future<bool> login() async {
    email = email.trim();
    senha = senha.trim();

    var valid = true;

    if (email == null || !email.contains("@")) {
      emailError = "Email invalido !!!";
      valid = false;
    } else {
      emailError = null;
    }

    if (senha == null || senha.length == 0) {
      senhaError = "Senha invalida !!!";
      valid = false;
    } else {
      senhaError = null;
    }

    if (!valid) {
      return false;
    }

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    ))
        .user;

    var tokenId = await user.getIdToken();
    valid = tokenId != null;

    return valid;
  }
}
