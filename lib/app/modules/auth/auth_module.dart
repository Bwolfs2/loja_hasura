import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/modules/auth/auth_controller.dart';
import '../../../app/modules/auth/auth_page.dart';
import '../../../app/modules/auth/pages/register/register_controller.dart';
import 'pages/register/register_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RegisterController()),
    Bind((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
    ChildRoute('/register', child: (_, args) => RegisterPage()),
  ];
}
