import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../app/modules/home/home_controller.dart';
import '../../../app/modules/home/home_page.dart';
import '../../../app/modules/home/pages/update_produto/update_produto_controller.dart';
import '../../../app/modules/home/pages/update_produto/update_produto_page.dart';
import '../../../app/modules/home/repositories/home_repository.dart';
import '../../../app/modules/home/repositories/update_produto_repository.dart';
import '../../../app/modules/home/widgets/card_produto/card_produto_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    //Controllers
    Bind((i) => CardProdutoController()),
    Bind((i) => HomeController(i.get<HomeRepository>())),

    Bind((i) => UpdateProdutoController(i.get<UpdateProdutoRepository>())),

    //Repositories
    Bind((i) => UpdateProdutoRepository(i.get<HasuraConnect>())),
    Bind((i) => HomeRepository(i.get<HasuraConnect>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute(
      '/UpdateProduto/:id',
      child: (_, args) => UpdateProdutoPage(
        id: args.params['id'],
      ),
    ),
  ];
}
