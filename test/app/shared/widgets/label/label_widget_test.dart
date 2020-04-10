import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/shared/widgets/label/label_widget.dart';

void main() {
  testWidgets('LabelWidget has message', (tester) async {
    await tester.pumpWidget(buildTestableWidget(LabelWidget(
      title: null,
    )));
    final textFinder = find.text('Label');
    expect(textFinder, findsOneWidget);
  });
}
