import 'package:loja_hasura/app/modules/home/models/produto_model.dart';
import 'package:mobx/mobx.dart';

import 'repositories/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final HomeRepository _repository;
  _HomeBase(this._repository) {
    listaProdutos = ObservableStream(_repository.getProduto());
  }

  @observable
  ObservableStream<List<ProdutoModel>> listaProdutos;
}
