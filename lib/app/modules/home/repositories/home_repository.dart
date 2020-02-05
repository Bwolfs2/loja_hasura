import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:loja_hasura/app/modules/home/models/produto_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  HomeRepository(this._hasuraConnect);


  Stream<List<ProdutoModel>> getProduto()  {
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

    var snapshot = _hasuraConnect.subscription(query);

    return snapshot.map((data)=>ProdutoModel.fromJsonList(data["data"]["produto"]));
    
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
