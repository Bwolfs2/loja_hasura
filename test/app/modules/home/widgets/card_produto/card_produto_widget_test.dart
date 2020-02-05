import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:loja_hasura/app/modules/home/widgets/card_produto/card_produto_widget.dart';

main() {
  testWidgets('CardProdutoWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CardProdutoWidget(
      categoriaProduto: null,
      nomeProduto: null,
      tipoProduto: null,
      valor: null, idProduto: null,
    )));
    final textFinder = find.text('CardProduto');
    expect(textFinder, findsOneWidget);
  });
}
