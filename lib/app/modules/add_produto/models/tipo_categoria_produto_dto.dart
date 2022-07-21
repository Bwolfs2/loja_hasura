// To parse this JSON data, do
//
//     final tipoCategoriaProdutoDto = tipoCategoriaProdutoDtoFromJson(jsonString);

///
class TipoCategoriaProdutoDto {
  ///tipos de produtos
  final List<TipoECategoriaDto> tipoProduto;

  ///categoria de produtos
  final List<TipoECategoriaDto> categoriaProduto;

  ///
  TipoCategoriaProdutoDto({
    required this.tipoProduto,
    required this.categoriaProduto,
  });

  ///
  TipoCategoriaProdutoDto copyWith({
    List<TipoECategoriaDto>? tipoProduto,
    List<TipoECategoriaDto>? categoriaProduto,
  }) =>
      TipoCategoriaProdutoDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
      );

  static TipoCategoriaProdutoDto fromMap(dynamic json) => TipoCategoriaProdutoDto(
        tipoProduto: List<TipoECategoriaDto>.from(json["tipo_produto"].map(TipoECategoriaDto.fromMap)),
        categoriaProduto: List<TipoECategoriaDto>.from(json["categoria_produto"].map(TipoECategoriaDto.fromMap)),
      );

  Map<String, dynamic> toMap() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto": List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
      };

  List<TipoCategoriaProdutoDto> fromJsonList(List list) {
    final a = list.map(TipoCategoriaProdutoDto.fromMap);
    return a.toList();
  }
}

class TipoECategoriaDto {
  final String id;
  final String descricao;

  TipoECategoriaDto({
    required this.id,
    required this.descricao,
  });

  TipoECategoriaDto copyWith({
    String? id,
    String? descricao,
  }) =>
      TipoECategoriaDto(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
      );

  factory TipoECategoriaDto.fromMap(dynamic json) => TipoECategoriaDto(
        id: json["id"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descricao": descricao,
      };
}
