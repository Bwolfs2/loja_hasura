import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/modules/splash/splash_controller.dart';
import '../../../app/modules/splash/splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController(i.get<FirebaseAuth>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
