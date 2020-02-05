// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProdutoController on _AddProdutoBase, Store {
  final _$descricaoAtom = Atom(name: '_AddProdutoBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_AddProdutoBase.valor');

  @override
  String get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$selectedCategoriaAtom =
      Atom(name: '_AddProdutoBase.selectedCategoria');

  @override
  TipoECategoriaDto get selectedCategoria {
    _$selectedCategoriaAtom.context.enforceReadPolicy(_$selectedCategoriaAtom);
    _$selectedCategoriaAtom.reportObserved();
    return super.selectedCategoria;
  }

  @override
  set selectedCategoria(TipoECategoriaDto value) {
    _$selectedCategoriaAtom.context.conditionallyRunInAction(() {
      super.selectedCategoria = value;
      _$selectedCategoriaAtom.reportChanged();
    }, _$selectedCategoriaAtom, name: '${_$selectedCategoriaAtom.name}_set');
  }

  final _$selectedTipoAtom = Atom(name: '_AddProdutoBase.selectedTipo');

  @override
  TipoECategoriaDto get selectedTipo {
    _$selectedTipoAtom.context.enforceReadPolicy(_$selectedTipoAtom);
    _$selectedTipoAtom.reportObserved();
    return super.selectedTipo;
  }

  @override
  set selectedTipo(TipoECategoriaDto value) {
    _$selectedTipoAtom.context.conditionallyRunInAction(() {
      super.selectedTipo = value;
      _$selectedTipoAtom.reportChanged();
    }, _$selectedTipoAtom, name: '${_$selectedTipoAtom.name}_set');
  }

  final _$tipoProdutoAtom = Atom(name: '_AddProdutoBase.tipoProduto');

  @override
  TipoCategoriaProdutoDto get tipoProduto {
    _$tipoProdutoAtom.context.enforceReadPolicy(_$tipoProdutoAtom);
    _$tipoProdutoAtom.reportObserved();
    return super.tipoProduto;
  }

  @override
  set tipoProduto(TipoCategoriaProdutoDto value) {
    _$tipoProdutoAtom.context.conditionallyRunInAction(() {
      super.tipoProduto = value;
      _$tipoProdutoAtom.reportChanged();
    }, _$tipoProdutoAtom, name: '${_$tipoProdutoAtom.name}_set');
  }

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future<bool> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$_AddProdutoBaseActionController =
      ActionController(name: '_AddProdutoBase');

  @override
  dynamic setDescricao(String _desc) {
    final _$actionInfo = _$_AddProdutoBaseActionController.startAction();
    try {
      return super.setDescricao(_desc);
    } finally {
      _$_AddProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValor(String _valor) {
    final _$actionInfo = _$_AddProdutoBaseActionController.startAction();
    try {
      return super.setValor(_valor);
    } finally {
      _$_AddProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    final _$actionInfo = _$_AddProdutoBaseActionController.startAction();
    try {
      return super.setSelectedCategoria(_selectedCategoria);
    } finally {
      _$_AddProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    final _$actionInfo = _$_AddProdutoBaseActionController.startAction();
    try {
      return super.setSelectedTipo(_selectedTipo);
    } finally {
      _$_AddProdutoBaseActionController.endAction(_$actionInfo);
    }
  }
}
