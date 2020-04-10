import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../../app/modules/add_produto/models/tipo_categoria_produto_dto.dart';

class AddProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  AddProdutoRepository(this._hasuraConnect);

  Future<TipoCategoriaProdutoDto> getTipoCategoriaProduto() async {
    var query = ''' 
            query getTipoCategoriaProduto {
                tipo_produto {
                  id
                  descricao
                }
                categoria_produto {
                  id
                  descricao
                }
              }
           ''';

    var snapshot = await _hasuraConnect.query(query);

    return TipoCategoriaProdutoDto.fromMap(snapshot["data"]);
  }

  Future<bool> addproduto(String descricao, String valor, String selectedTipo,
      String selectedCategoria) async {
    var mutation = r''' 
                  mutation addProduto($nome: String, $categoria: uuid, $tipo: uuid, $valor: float8) {
                    insert_produto(objects: {nome: $nome, categoria_produto_id: $categoria, tipo_produto_id: $tipo, valor: $valor}) {
                      affected_rows
                    }
                  }
              ''';

    var snapshot = await _hasuraConnect.mutation(mutation, variables: {
      "nome": descricao,
      "categoria": selectedCategoria,
      "tipo": selectedTipo,
      "valor": valor
    });

    return snapshot["data"]["insert_produto"]["affected_rows"] > 0;
  }

  @override
  void dispose() {}
}
