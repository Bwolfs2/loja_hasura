import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

import '../../../app/modules/home/models/produto_model.dart';
import 'models/produto_model.dart';
import 'repositories/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store implements Disposable {
  final HomeRepository _repository;

  @observable
  Snapshot<List<ProdutoModel>>? snapshot;

  _HomeBase(this._repository) {
    getData();
  }

  Future getData() async {
    snapshot = await _repository.getProduto();
  }

  @computed
  ObservableStream<List<ProdutoModel>>? get listaProdutos => snapshot?.asObservable();

  @override
  void dispose() {
    snapshot?.close();
  }
}
