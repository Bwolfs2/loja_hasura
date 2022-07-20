import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(OKToast(
    child: ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  ));
}
