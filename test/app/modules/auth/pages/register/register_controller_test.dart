import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:loja_hasura/app/modules/auth/pages/register/register_controller.dart';
import 'package:loja_hasura/app/modules/auth/auth_module.dart';

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

    test("Set Value", () {
      expect(register.value, equals(0));
      register.increment();
      expect(register.value, equals(1));
    });
  });
}
