import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/app_controller.dart';
import '../app/app_widget.dart';
import '../app/modules/add_produto/add_produto_module.dart';
import '../app/modules/home/home_module.dart';
import '../app/shared/custom_combobox/custom_combobox_controller.dart';
import '../app/shared/custom_hasura_connect.dart';
import 'modules/auth/auth_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomComboboxController()),
        Bind((i) => AppController()),
        //Outros
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => FirebaseAuth.instance),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplashModule()),
        Router('/auth', module: AuthModule()),
        Router('/home', module: HomeModule()),
        Router('/AddProduto', module: AddProdutoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
