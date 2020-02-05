import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:loja_hasura/app/modules/add_produto/add_produto_controller.dart';
import 'package:loja_hasura/app/modules/add_produto/add_produto_module.dart';

void main() {
  initModule(AddProdutoModule());
  AddProdutoController addproduto;

  setUp(() {
    addproduto = AddProdutoModule.to.get<AddProdutoController>();
  });

  group('AddProdutoController Test', () {
    test("First Test", () {
      expect(addproduto, isInstanceOf<AddProdutoController>());
    });
  });
}
