import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterBase with _$RegisterController;

abstract class _RegisterBase with Store {


  @observable
  String email = "";
  @observable
  String senha = "";

  @observable
  String confirmacaoSenha = "";

  @observable
  String emailError;
  @observable
  String senhaError;

  @action
  void setEmail(String _email) => email = _email;

  @action
  void setSenha(String _senha) => senha = _senha;
  @action
  void setConfirmacaoSenha(String _confirmacaoSenha) =>
      confirmacaoSenha = _confirmacaoSenha;

  @action
  Future<bool> criarConta() async {
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

    if (senha != confirmacaoSenha) {
      senhaError = "Senha de confirmacao nao bate com a senha informada!!!";
      valid = false;
    }

    if (!valid) {
      return false;
    }

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    ))
        .user;

    var tokenId = await user.getIdToken();
    valid = tokenId != null;

    return valid;
  }
}
