import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/modules/add_produto/add_produto_page.dart';

void main() {
  testWidgets('AddProdutoPage has title', (tester) async {
    await tester
        .pumpWidget(buildTestableWidget(AddProdutoPage(title: 'AddProduto')));
    final titleFinder = find.text('AddProduto');
    expect(titleFinder, findsOneWidget);
  });
}
