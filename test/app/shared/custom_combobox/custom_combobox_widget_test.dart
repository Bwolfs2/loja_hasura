import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/shared/custom_combobox/custom_combobox_widget.dart';

void main() {
  testWidgets('CustomComboboxWidget has message', (tester) async {
    await tester.pumpWidget(buildTestableWidget(CustomComboboxWidget(
      items: <Model>[],
      itemSelecionado: null,
      onChange: (model) {},
    )));
    final textFinder = find.text('CustomCombobox');
    expect(textFinder, findsOneWidget);
  });
}
