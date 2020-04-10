import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/modules/auth/pages/register/register_page.dart';

void main() {
  testWidgets('RegisterPage has title', (tester) async {
    await tester
        .pumpWidget(buildTestableWidget(RegisterPage(title: 'Register')));
    final titleFinder = find.text('Register');
    expect(titleFinder, findsOneWidget);
  });
}
