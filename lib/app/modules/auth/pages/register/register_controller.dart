import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterBase with _$RegisterController;

abstract class _RegisterBase with Store {
  final SharedPreferences shared;
  _RegisterBase(this.shared);

  @observable
  String email = "";
  @observable
  String senha = "";

  @observable
  String confirmacaoSenha = "";

  @action
  void setEmail(String _email) => email = _email;

  @action
  void setSenha(String _senha) => senha = _senha;
  @action
  void setConfirmacaoSenha(String _confirmacaoSenha) =>
      confirmacaoSenha = _confirmacaoSenha;

  @action
  Future<bool> criarConta() async {
    if (senha != confirmacaoSenha) {
      return false;
    }

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
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
