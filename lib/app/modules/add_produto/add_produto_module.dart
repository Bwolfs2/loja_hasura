import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../app/modules/add_produto/add_produto_controller.dart';
import '../../../app/modules/add_produto/add_produto_page.dart';
import '../../modules/add_produto/repositories/add_produto_repository.dart';

class AddProdutoModule extends Module {
  @override
  final List<Bind> binds = [
    //Controllers
    Bind((i) => AddProdutoController(i.get<AddProdutoRepository>())),

    ///Repositories
    Bind((i) => AddProdutoRepository(i.get<HasuraConnect>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AddProdutoPage()),
  ];
}
