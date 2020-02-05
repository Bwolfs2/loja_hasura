import 'package:mobx/mobx.dart';

part 'custom_combobox_controller.g.dart';

class CustomComboboxController = _CustomComboboxBase
    with _$CustomComboboxController;

abstract class _CustomComboboxBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
