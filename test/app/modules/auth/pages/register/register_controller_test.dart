import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/modules/auth/auth_module.dart';
import 'package:loja_hasura/app/modules/auth/pages/register/register_controller.dart';

void main() {
  initModule(AuthModule());
  RegisterController register;

  setUp(() {
    register = AuthModule.to.get<RegisterController>();
  });

  group('RegisterController Test', () {
    test("First Test", () {
      expect(register, isInstanceOf<RegisterController>());
    });

    test("Set Value", () {});
  });
}
