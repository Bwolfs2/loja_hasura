import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/app_controller.dart';
import '../app/modules/add_produto/add_produto_module.dart';
import '../app/modules/home/home_module.dart';
import '../app/shared/custom_combobox/custom_combobox_controller.dart';
import '../app/shared/custom_hasura_connect.dart';
import 'modules/auth/auth_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CustomComboboxController()),
    Bind((i) => AppController()),
    //Outros
    Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
    Bind((i) => FirebaseAuth.instance),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/AddProduto', module: AddProdutoModule()),
  ];
}
