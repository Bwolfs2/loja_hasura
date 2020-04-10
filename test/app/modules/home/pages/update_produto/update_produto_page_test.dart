import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UpdateProdutoPage has title', (tester) async {
    final titleFinder = find.text('UpdateProduto');
    expect(titleFinder, findsOneWidget);
  });
}
