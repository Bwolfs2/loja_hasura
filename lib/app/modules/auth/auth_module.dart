import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/modules/auth/auth_controller.dart';
import '../../../app/modules/auth/auth_page.dart';
import '../../../app/modules/auth/pages/register/register_controller.dart';
import 'pages/register/register_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthPage()),
        Router('/register', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
