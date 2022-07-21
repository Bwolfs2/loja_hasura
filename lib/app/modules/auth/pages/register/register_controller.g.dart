// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterBase, Store {
  late final _$emailAtom = Atom(name: '_RegisterBase.email', context: context);

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

  late final _$senhaAtom = Atom(name: '_RegisterBase.senha', context: context);

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

  late final _$confirmacaoSenhaAtom =
      Atom(name: '_RegisterBase.confirmacaoSenha', context: context);

  @override
  String get confirmacaoSenha {
    _$confirmacaoSenhaAtom.reportRead();
    return super.confirmacaoSenha;
  }

  @override
  set confirmacaoSenha(String value) {
    _$confirmacaoSenhaAtom.reportWrite(value, super.confirmacaoSenha, () {
      super.confirmacaoSenha = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: '_RegisterBase.emailError', context: context);

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$senhaErrorAtom =
      Atom(name: '_RegisterBase.senhaError', context: context);

  @override
  String? get senhaError {
    _$senhaErrorAtom.reportRead();
    return super.senhaError;
  }

  @override
  set senhaError(String? value) {
    _$senhaErrorAtom.reportWrite(value, super.senhaError, () {
      super.senhaError = value;
    });
  }

  late final _$criarContaAsyncAction =
      AsyncAction('_RegisterBase.criarConta', context: context);

  @override
  Future<bool> criarConta() {
    return _$criarContaAsyncAction.run(() => super.criarConta());
  }

  late final _$_RegisterBaseActionController =
      ActionController(name: '_RegisterBase', context: context);

  @override
  void setEmail(String _email) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction(
        name: '_RegisterBase.setEmail');
    try {
      return super.setEmail(_email);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String _senha) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction(
        name: '_RegisterBase.setSenha');
    try {
      return super.setSenha(_senha);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmacaoSenha(String _confirmacaoSenha) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction(
        name: '_RegisterBase.setConfirmacaoSenha');
    try {
      return super.setConfirmacaoSenha(_confirmacaoSenha);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
confirmacaoSenha: ${confirmacaoSenha},
emailError: ${emailError},
senhaError: ${senhaError}
    ''';
  }
}
