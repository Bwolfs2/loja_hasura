import 'package:loja_hasura/app/app_module.dart';
import 'package:loja_hasura/app/modules/auth/pages/register/register_controller.dart';
import 'package:loja_hasura/app/modules/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_hasura/app/modules/auth/auth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/register/register_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController(AppModule.to.get<SharedPreferences>())),
        Bind((i) => AuthController(AppModule.to.get<SharedPreferences>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthPage()),
        Router('/register', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
