import 'package:flutter/material.dart';
import 'package:loja_hasura/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:loja_hasura/app/modules/home/models/produto_tipo_categoria_produto_dto.dart';
import 'package:loja_hasura/app/modules/home/repositories/update_produto_repository.dart';
import 'package:mobx/mobx.dart';

part 'update_produto_controller.g.dart';

class UpdateProdutoController = _UpdateProdutoBase
    with _$UpdateProdutoController;

abstract class _UpdateProdutoBase with Store {
  final UpdateProdutoRepository updateProdutoRepository;
  final String idProduto;
  _UpdateProdutoBase(this.updateProdutoRepository, this.idProduto) {
    updateProdutoRepository
        .getProdutoTipoCategoriaProduto(idProduto)
        .then((data) {
      updatedProduto = data;
      valor = updatedProduto.produto.valor.toString();
      descricao = updatedProduto.produto.nome;
      selectedCategoria = updatedProduto.produto.categoriaProduto;
      selectedTipo = updatedProduto.produto.tipoProduto;
      descricaoController.text = descricao;
      valorController.text = valor;
    });
  }

  var descricaoController = TextEditingController();
  var valorController = TextEditingController();

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
  ProdutoTipoCategoriaProdutoDto updatedProduto;

  @action
  Future<bool> salvar() async {
    if (descricao != null &&
        valor != null &&
        selectedTipo?.id != null &&
        selectedCategoria?.id != null) {
      return await updateProdutoRepository.updateProduto(
        idProduto: idProduto,
        descricao: descricao,
        valor: valor,
        selectedTipo: selectedTipo.id,
        selectedCategoria: selectedCategoria.id,
      );
    }
    return false;
  }
}
