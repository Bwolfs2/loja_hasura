import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import '../../../../../app/modules/home/models/produto_tipo_categoria_produto_dto.dart';
import '../../../../../app/modules/home/repositories/update_produto_repository.dart';

part 'update_produto_controller.g.dart';

class UpdateProdutoController = _UpdateProdutoBase with _$UpdateProdutoController;

abstract class _UpdateProdutoBase with Store {
  final UpdateProdutoRepository updateProdutoRepository;
  _UpdateProdutoBase(this.updateProdutoRepository);

  void init(String _idProduto) {
    updateProdutoRepository.getProdutoTipoCategoriaProduto(_idProduto).then((data) {
      updatedProduto = data;
      valor = updatedProduto?.produto.valor.toString() ?? '';
      descricao = updatedProduto?.produto.nome ?? '';
      selectedCategoria = updatedProduto?.produto.categoriaProduto;
      selectedTipo = updatedProduto?.produto.tipoProduto;
      descricaoController.text = descricao;
      valorController.text = valor;
    });
  }

  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  @observable
  String descricao = "";

  @observable
  String valor = "";

  @observable
  TipoECategoriaDto? selectedCategoria;

  @observable
  TipoECategoriaDto? selectedTipo;

  @observable
  String? descricaoError;
  @observable
  String? valorError;
  @observable
  String? selectedCategoriaError;
  @observable
  String? selectedTipoError;

  @action
  void setDescricao(String _desc) {
    descricao = _desc;
    _validDescricao();
  }

  @action
  void setValor(String _valor) {
    valor = _valor;
    _validValor();
  }

  @action
  void setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @action
  void setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }

  @observable
  ProdutoTipoCategoriaProdutoDto? updatedProduto;

  bool isValid = true;

  _validDescricao() {
    descricao = descricao.trim();
    if (descricao.isEmpty) {
      descricaoError = "Descricao invalida!!";
      isValid = false;
    } else {
      descricaoError = null;
    }
  }

  _validValor() {
    valor = valor.trim();
    if (valor.isEmpty) {
      valorError = "Valor invalida!!";
      isValid = false;
    } else {
      valorError = null;
    }
  }

  @action
  Future<bool> salvar(String idProduto) async {
    isValid = true;
    _validDescricao();
    _validValor();

    if (selectedTipo?.id == null) {
      selectedTipoError = "Tipo invalido!!";
      isValid = false;
    } else {
      selectedTipoError = null;
    }

    if (selectedCategoria?.id == null) {
      selectedCategoriaError = "Categoria invalida!!";
      isValid = false;
    } else {
      selectedCategoriaError = null;
    }

    if (isValid) {
      return await updateProdutoRepository.updateProduto(
        idProduto: idProduto,
        descricao: descricao,
        valor: valor,
        selectedTipo: selectedTipo?.id,
        selectedCategoria: selectedCategoria?.id,
      );
    }
    return false;
  }
}
