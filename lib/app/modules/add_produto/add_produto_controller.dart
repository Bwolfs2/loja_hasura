import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'models/tipo_categoria_produto_dto.dart';
import 'repositories/add_produto_repository.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoBase with _$AddProdutoController;

abstract class _AddProdutoBase with Store {
  final AddProdutoRepository addProdutoRepository;

  _AddProdutoBase(this.addProdutoRepository) {
    addProdutoRepository.getTipoCategoriaProduto().then((data) {
      tipoProduto = data;
    });
  }

  @observable
  String descricao = "";

  @action
  setDescricao(String _desc) {
    descricao = _desc;
  }

  @observable
  String valor = "";

  @action
  setValor(String _valor) {
    valor = _valor;
  }

  @observable
  TipoECategoriaDto selectedCategoria;

  @action
  setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoECategoriaDto selectedTipo;

  @action
  setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  Future<bool> salvar() async {
    if (descricao != null &&
        valor != null &&
        selectedTipo?.id != null &&
        selectedCategoria?.id != null) {
      return await addProdutoRepository.addproduto(
          descricao, valor, selectedTipo.id, selectedCategoria.id);
    }
    return false;
  }
}
