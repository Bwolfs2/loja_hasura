// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateProdutoController on _UpdateProdutoBase, Store {
  final _$descricaoAtom = Atom(name: '_UpdateProdutoBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$valorAtom = Atom(name: '_UpdateProdutoBase.valor');

  @override
  String get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$selectedCategoriaAtom =
      Atom(name: '_UpdateProdutoBase.selectedCategoria');

  @override
  TipoECategoriaDto get selectedCategoria {
    _$selectedCategoriaAtom.reportRead();
    return super.selectedCategoria;
  }

  @override
  set selectedCategoria(TipoECategoriaDto value) {
    _$selectedCategoriaAtom.reportWrite(value, super.selectedCategoria, () {
      super.selectedCategoria = value;
    });
  }

  final _$selectedTipoAtom = Atom(name: '_UpdateProdutoBase.selectedTipo');

  @override
  TipoECategoriaDto get selectedTipo {
    _$selectedTipoAtom.reportRead();
    return super.selectedTipo;
  }

  @override
  set selectedTipo(TipoECategoriaDto value) {
    _$selectedTipoAtom.reportWrite(value, super.selectedTipo, () {
      super.selectedTipo = value;
    });
  }

  final _$descricaoErrorAtom = Atom(name: '_UpdateProdutoBase.descricaoError');

  @override
  String get descricaoError {
    _$descricaoErrorAtom.reportRead();
    return super.descricaoError;
  }

  @override
  set descricaoError(String value) {
    _$descricaoErrorAtom.reportWrite(value, super.descricaoError, () {
      super.descricaoError = value;
    });
  }

  final _$valorErrorAtom = Atom(name: '_UpdateProdutoBase.valorError');

  @override
  String get valorError {
    _$valorErrorAtom.reportRead();
    return super.valorError;
  }

  @override
  set valorError(String value) {
    _$valorErrorAtom.reportWrite(value, super.valorError, () {
      super.valorError = value;
    });
  }

  final _$selectedCategoriaErrorAtom =
      Atom(name: '_UpdateProdutoBase.selectedCategoriaError');

  @override
  String get selectedCategoriaError {
    _$selectedCategoriaErrorAtom.reportRead();
    return super.selectedCategoriaError;
  }

  @override
  set selectedCategoriaError(String value) {
    _$selectedCategoriaErrorAtom
        .reportWrite(value, super.selectedCategoriaError, () {
      super.selectedCategoriaError = value;
    });
  }

  final _$selectedTipoErrorAtom =
      Atom(name: '_UpdateProdutoBase.selectedTipoError');

  @override
  String get selectedTipoError {
    _$selectedTipoErrorAtom.reportRead();
    return super.selectedTipoError;
  }

  @override
  set selectedTipoError(String value) {
    _$selectedTipoErrorAtom.reportWrite(value, super.selectedTipoError, () {
      super.selectedTipoError = value;
    });
  }

  final _$updatedProdutoAtom = Atom(name: '_UpdateProdutoBase.updatedProduto');

  @override
  ProdutoTipoCategoriaProdutoDto get updatedProduto {
    _$updatedProdutoAtom.reportRead();
    return super.updatedProduto;
  }

  @override
  set updatedProduto(ProdutoTipoCategoriaProdutoDto value) {
    _$updatedProdutoAtom.reportWrite(value, super.updatedProduto, () {
      super.updatedProduto = value;
    });
  }

  final _$salvarAsyncAction = AsyncAction('_UpdateProdutoBase.salvar');

  @override
  Future<bool> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$_UpdateProdutoBaseActionController =
      ActionController(name: '_UpdateProdutoBase');

  @override
  void setDescricao(String _desc) {
    final _$actionInfo = _$_UpdateProdutoBaseActionController.startAction(
        name: '_UpdateProdutoBase.setDescricao');
    try {
      return super.setDescricao(_desc);
    } finally {
      _$_UpdateProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor(String _valor) {
    final _$actionInfo = _$_UpdateProdutoBaseActionController.startAction(
        name: '_UpdateProdutoBase.setValor');
    try {
      return super.setValor(_valor);
    } finally {
      _$_UpdateProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    final _$actionInfo = _$_UpdateProdutoBaseActionController.startAction(
        name: '_UpdateProdutoBase.setSelectedCategoria');
    try {
      return super.setSelectedCategoria(_selectedCategoria);
    } finally {
      _$_UpdateProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    final _$actionInfo = _$_UpdateProdutoBaseActionController.startAction(
        name: '_UpdateProdutoBase.setSelectedTipo');
    try {
      return super.setSelectedTipo(_selectedTipo);
    } finally {
      _$_UpdateProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
descricao: ${descricao},
valor: ${valor},
selectedCategoria: ${selectedCategoria},
selectedTipo: ${selectedTipo},
descricaoError: ${descricaoError},
valorError: ${valorError},
selectedCategoriaError: ${selectedCategoriaError},
selectedTipoError: ${selectedTipoError},
updatedProduto: ${updatedProduto}
    ''';
  }
}
