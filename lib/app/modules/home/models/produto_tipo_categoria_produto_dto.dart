// To parse this JSON data, do
//
//     final produtoTipoCategoriaProdutoDto = produtoTipoCategoriaProdutoDtoFromJson(jsonString);

import '../../../../app/modules/add_produto/models/tipo_categoria_produto_dto.dart';

class ProdutoTipoCategoriaProdutoDto {
  final List<TipoECategoriaDto> tipoProduto;
  final List<TipoECategoriaDto> categoriaProduto;
  final Produto produto;

  ProdutoTipoCategoriaProdutoDto({
    required this.tipoProduto,
    required this.categoriaProduto,
    required this.produto,
  });

  ProdutoTipoCategoriaProdutoDto copyWith({
    List<TipoECategoriaDto>? tipoProduto,
    List<TipoECategoriaDto>? categoriaProduto,
    Produto? produto,
  }) =>
      ProdutoTipoCategoriaProdutoDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        produto: produto ?? this.produto,
      );

  factory ProdutoTipoCategoriaProdutoDto.fromMap(Map<String, dynamic> json) => ProdutoTipoCategoriaProdutoDto(
        tipoProduto: List<TipoECategoriaDto>.from(json["tipo_produto"].map(TipoECategoriaDto.fromMap)),
        categoriaProduto: List<TipoECategoriaDto>.from(json["categoria_produto"].map(TipoECategoriaDto.fromMap)),
        produto: Produto.fromMap(json["produto_by_pk"]),
      );

  Map<String, dynamic> toMap() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto": List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
        "produto_by_pk": produto.toMap(),
      };
}

class Produto {
  final String id;
  final String nome;
  final String tipoProdutoId;
  final TipoECategoriaDto categoriaProduto;
  final TipoECategoriaDto tipoProduto;
  final double valor;

  Produto({
    required this.id,
    required this.nome,
    required this.tipoProdutoId,
    required this.categoriaProduto,
    required this.tipoProduto,
    required this.valor,
  });

  Produto copyWith({
    String? id,
    String? nome,
    String? tipoProdutoId,
    TipoECategoriaDto? categoriaProduto,
    TipoECategoriaDto? tipoProduto,
    double? valor,
  }) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        tipoProdutoId: tipoProdutoId ?? this.tipoProdutoId,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        tipoProduto: tipoProduto ?? this.tipoProduto,
        valor: valor ?? this.valor,
      );

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
        id: json["id"],
        nome: json["nome"],
        tipoProdutoId: json["tipo_produto_id"],
        categoriaProduto: TipoECategoriaDto.fromMap(json["categoria_produto"]),
        tipoProduto: TipoECategoriaDto.fromMap(json["tipo_produto"]),
        valor: json["valor"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "tipo_produto_id": tipoProdutoId,
        "categoria_produto": categoriaProduto.toMap(),
        "tipo_produto": tipoProduto.toMap(),
        "valor": valor
      };
}
