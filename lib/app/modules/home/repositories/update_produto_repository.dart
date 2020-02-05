import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:loja_hasura/app/modules/home/models/produto_tipo_categoria_produto_dto.dart';

class UpdateProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  UpdateProdutoRepository(this._hasuraConnect);

  Future<ProdutoTipoCategoriaProdutoDto> getProdutoTipoCategoriaProduto(
      String idProduto) async {
    var query = r''' 
           query getProdutoTipoCategoriaProduto($idProduto: uuid!) {
              tipo_produto {
                id
                descricao
              }
              categoria_produto {
                id
                descricao
              }
              produto_by_pk(id: $idProduto) {
                id
                nome
                valor
                tipo_produto_id
                categoria_produto {
                  id
                  descricao
                }
                tipo_produto {
                  id
                  descricao
                }
              }              
            }
      ''';

    var snapshot =
        await _hasuraConnect.query(query, variables: {"idProduto": idProduto});

    return ProdutoTipoCategoriaProdutoDto.fromMap(snapshot["data"]);
  }

  Future<bool> updateProduto(
      {String idProduto,
      String descricao,
      String valor,
      String selectedTipo,
      String selectedCategoria}) async {
    try {
      var mutation = r''' 
           mutation update_produto($idProduto: uuid, $nome: String, $categoria: uuid, $tipo: uuid, $valor: float8) {
              update_produto(where: {id: {_eq: $idProduto}},
                _set: {
                  nome: $nome,
                  tipo_produto_id: $tipo,
                  valor: $valor, 
                  categoria_produto_id: $categoria})
              {
                affected_rows
              }
            }
      ''';

      var snapshot = await _hasuraConnect.mutation(mutation, variables: {
        "nome": descricao,
        "categoria": selectedCategoria,
        "tipo": selectedTipo,
        "valor": double.parse(valor),
        "idProduto": idProduto,
      });

      return snapshot["data"]["update_produto"]["affected_rows"] > 0;
    } catch (e) {
      return false;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
