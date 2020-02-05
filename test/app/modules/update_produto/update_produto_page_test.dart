import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:loja_hasura/app/modules/home/pages/update_produto/update_produto_page.dart';


main() {
  testWidgets('UpdateProdutoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(UpdateProdutoPage(title: 'UpdateProduto', id: null,)));
    final titleFinder = find.text('UpdateProduto');
    expect(titleFinder, findsOneWidget);
  });
}
