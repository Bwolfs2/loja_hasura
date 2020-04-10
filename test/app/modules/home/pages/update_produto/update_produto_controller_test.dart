import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/modules/home/home_module.dart';
import 'package:loja_hasura/app/modules/home/pages/update_produto/update_produto_controller.dart';

void main() {
  initModule(HomeModule());
  UpdateProdutoController updateproduto;

  setUp(() {
    updateproduto = HomeModule.to.get<UpdateProdutoController>();
  });

  group('UpdateProdutoController Test', () {
    test("First Test", () {
      expect(updateproduto, isInstanceOf<UpdateProdutoController>());
    });

    test("Set Value", () {});
  });
}
