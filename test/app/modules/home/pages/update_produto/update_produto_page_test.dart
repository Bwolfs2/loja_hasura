import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:loja_hasura/app/modules/home/pages/update_produto/update_produto_page.dart';

main() {
  testWidgets('UpdateProdutoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(UpdateProdutoPage(title: 'UpdateProduto')));
    final titleFinder = find.text('UpdateProduto');
    expect(titleFinder, findsOneWidget);
  });
}
