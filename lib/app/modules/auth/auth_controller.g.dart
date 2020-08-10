// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthBase, Store {
  final _$emailAtom = Atom(name: '_AuthBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_AuthBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$emailErrorAtom = Atom(name: '_AuthBase.emailError');

  @override
  String get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  final _$senhaErrorAtom = Atom(name: '_AuthBase.senhaError');

  @override
  String get senhaError {
    _$senhaErrorAtom.reportRead();
    return super.senhaError;
  }

  @override
  set senhaError(String value) {
    _$senhaErrorAtom.reportWrite(value, super.senhaError, () {
      super.senhaError = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthBase.login');

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_AuthBaseActionController = ActionController(name: '_AuthBase');

  @override
  void setEmail(String _email) {
    final _$actionInfo =
        _$_AuthBaseActionController.startAction(name: '_AuthBase.setEmail');
    try {
      return super.setEmail(_email);
    } finally {
      _$_AuthBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String _senha) {
    final _$actionInfo =
        _$_AuthBaseActionController.startAction(name: '_AuthBase.setSenha');
    try {
      return super.setSenha(_senha);
    } finally {
      _$_AuthBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
emailError: ${emailError},
senhaError: ${senhaError}
    ''';
  }
}
