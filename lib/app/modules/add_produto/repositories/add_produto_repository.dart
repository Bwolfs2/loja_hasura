import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/tipo_categoria_produto_dto.dart';

class AddProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  AddProdutoRepository(this._hasuraConnect);

  Future<TipoCategoriaProdutoDto> getTipoCategoriaProduto() async {
    const query = ''' 

query getTipoCategoriaProduto {
    tipo_produto {
      id
      descricao
    }
    categoria_produto {
      id
      descricao
    }
}''';

    final snapshot = await _hasuraConnect.query(query);

    return TipoCategoriaProdutoDto.fromMap(snapshot["data"]);
  }

  Future<bool> addproduto(
    String descricao,
    String valor,
    String selectedTipo,
    String selectedCategoria,
  ) async {
    const mutation = r''' 




                  mutation addProduto($nome: String, $categoria: uuid, $tipo: uuid, $valor: float8) {
                    insert_produto(objects: {nome: $nome, categoria_produto_id: $categoria, tipo_produto_id: $tipo, valor: $valor}) {
                      affected_rows
                    }
                  }
              ''';

    final snapshot = await _hasuraConnect.mutation(
      mutation,
      variables: {
        "nome": descricao,
        "categoria": selectedCategoria,
        "tipo": selectedTipo,
        "valor": valor
      },
    );

    return snapshot["data"]["insert_produto"]["affected_rows"] > 0;
  }

  @override
  void dispose() {}
}
