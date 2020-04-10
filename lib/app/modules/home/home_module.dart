import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../app/app_module.dart';
import '../../../app/modules/home/home_controller.dart';
import '../../../app/modules/home/home_page.dart';
import '../../../app/modules/home/pages/update_produto/update_produto_controller.dart';
import '../../../app/modules/home/pages/update_produto/update_produto_page.dart';
import '../../../app/modules/home/repositories/home_repository.dart';
import '../../../app/modules/home/repositories/update_produto_repository.dart';
import '../../../app/modules/home/widgets/card_produto/card_produto_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Controllers
        Bind((i) => CardProdutoController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),

        Bind(
            (i) => UpdateProdutoController(
                i.get<UpdateProdutoRepository>(), i.params["id"]),
            singleton: false),

        //Repositories
        Bind((i) => UpdateProdutoRepository(AppModule.to.get<HasuraConnect>())),
        Bind((i) => HomeRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/UpdateProduto/:id',
            child: (_, args) => UpdateProdutoPage(
                  id: args.params['id'],
                )),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
