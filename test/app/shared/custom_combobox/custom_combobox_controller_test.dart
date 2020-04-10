import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/app_module.dart';
import 'package:loja_hasura/app/shared/custom_combobox/custom_combobox_controller.dart';

void main() {
  initModule(AppModule());
  CustomComboboxController customcombobox;

  setUp(() {
    customcombobox = AppModule.to.get<CustomComboboxController>();
  });

  group('CustomComboboxController Test', () {
    test("First Test", () {
      expect(customcombobox, isInstanceOf<CustomComboboxController>());
    });

    test("Set Value", () {
      expect(customcombobox.value, equals(0));
      customcombobox.increment();
      expect(customcombobox.value, equals(1));
    });
  });
}
