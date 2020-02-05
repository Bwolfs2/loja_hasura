// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterBase, Store {
  final _$emailAtom = Atom(name: '_RegisterBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_RegisterBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$confirmacaoSenhaAtom = Atom(name: '_RegisterBase.confirmacaoSenha');

  @override
  String get confirmacaoSenha {
    _$confirmacaoSenhaAtom.context.enforceReadPolicy(_$confirmacaoSenhaAtom);
    _$confirmacaoSenhaAtom.reportObserved();
    return super.confirmacaoSenha;
  }

  @override
  set confirmacaoSenha(String value) {
    _$confirmacaoSenhaAtom.context.conditionallyRunInAction(() {
      super.confirmacaoSenha = value;
      _$confirmacaoSenhaAtom.reportChanged();
    }, _$confirmacaoSenhaAtom, name: '${_$confirmacaoSenhaAtom.name}_set');
  }

  final _$criarContaAsyncAction = AsyncAction('criarConta');

  @override
  Future<bool> criarConta() {
    return _$criarContaAsyncAction.run(() => super.criarConta());
  }

  final _$_RegisterBaseActionController =
      ActionController(name: '_RegisterBase');

  @override
  void setEmail(String _email) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.setEmail(_email);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String _senha) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.setSenha(_senha);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmacaoSenha(String _confirmacaoSenha) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.setConfirmacaoSenha(_confirmacaoSenha);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }
}
