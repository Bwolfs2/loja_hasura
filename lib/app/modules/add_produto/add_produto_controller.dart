import 'package:mobx/mobx.dart';

import 'models/tipo_categoria_produto_dto.dart';
import 'repositories/add_produto_repository.dart';

part 'add_produto_controller.g.dart';

///meu metodo faz x coisas
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

  @observable
  String valor = "";

  @observable
  String descricaoError;
  @observable
  String valorError;
  @observable
  String selectedCategoriaError;
  @observable
  String selectedTipoError;

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

  @observable
  TipoECategoriaDto selectedCategoria;

  @action
  void setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoECategoriaDto selectedTipo;

  @action
  void setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  bool isValid = true;

  void _validDescricao() {
    descricao = descricao.trim();
    if (descricao == null || descricao.length == 0) {
      descricaoError = "Descricao invalida!!";
      isValid = false;
    } else {
      descricaoError = null;
    }
  }

  _validValor() {
    valor = valor.trim();
    if (valor == null || valor.length == 0) {
      valorError = "Valor invalida!!";
      isValid = false;
    } else {
      valorError = null;
    }
  }

  @action
  Future<bool> salvar() async {
    bool isValid = true;
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
      return await addProdutoRepository.addproduto(
          descricao, valor, selectedTipo.id, selectedCategoria.id);
    }
    return false;
  }
}
