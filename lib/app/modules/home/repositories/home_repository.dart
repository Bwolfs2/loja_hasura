import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../../app/modules/home/models/produto_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  HomeRepository(this._hasuraConnect);

  Future<Snapshot<List<ProdutoModel>>> getProduto() async {
    var query = '''
              subscription getProdutos {
                produto {
                  id
                  nome
                  valor
                  tipo_produto {
                    descricao
                  }    
                  categoria_produto {
                    descricao
                  }    
                }
              }''';

    var snapshot = await _hasuraConnect.subscription(query);

    return snapshot.map((data) {
      if (data == null) {
        return null;
      }
      return ProdutoModel.fromJsonList(data["data"]["produto"]);
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
