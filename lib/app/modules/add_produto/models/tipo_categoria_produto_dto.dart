// To parse this JSON data, do
//
//     final tipoCategoriaProdutoDto = tipoCategoriaProdutoDtoFromJson(jsonString);

import 'dart:convert';

///
class TipoCategoriaProdutoDto {
  ///tipos de produtos
  final List<TipoECategoriaDto> tipoProduto;

  ///categoria de produtos
  final List<TipoECategoriaDto> categoriaProduto;

  ///
  TipoCategoriaProdutoDto({
    this.tipoProduto,
    this.categoriaProduto,
  });

  ///
  TipoCategoriaProdutoDto copyWith({
    List<TipoECategoriaDto> tipoProduto,
    List<TipoECategoriaDto> categoriaProduto,
  }) =>
      TipoCategoriaProdutoDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
      );

  factory TipoCategoriaProdutoDto.fromJson(String str) =>
      TipoCategoriaProdutoDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoCategoriaProdutoDto.fromMap(Map<String, dynamic> json) =>
      TipoCategoriaProdutoDto(
        tipoProduto: List<TipoECategoriaDto>.from(
            json["tipo_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
        categoriaProduto: List<TipoECategoriaDto>.from(
            json["categoria_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto":
            List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
      };

  static List<TipoCategoriaProdutoDto> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<TipoCategoriaProdutoDto>(
            (item) => TipoCategoriaProdutoDto.fromMap(item))
        .toList();
  }
}

class TipoECategoriaDto {
  final String id;
  final String descricao;

  TipoECategoriaDto({
    this.id,
    this.descricao,
  });

  TipoECategoriaDto copyWith({
    String id,
    String descricao,
  }) =>
      TipoECategoriaDto(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
      );

  factory TipoECategoriaDto.fromJson(String str) =>
      TipoECategoriaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoECategoriaDto.fromMap(Map<String, dynamic> json) =>
      TipoECategoriaDto(
        id: json["id"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descricao": descricao,
      };
}
