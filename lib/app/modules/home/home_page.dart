import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/modules/home/home_controller.dart';
import 'widgets/card_produto/card_produto_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Modular.get<HomeController>();

  @override
  void dispose() {
    Modular.dispose<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.power_settings_new,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // Modular.get<HasuraConnect>().disconnect();
                Modular.to.pushReplacementNamed("/auth");
              },
            )
          ],
        ),
        body: Observer(
          builder: (context) {
            if (controller.listaProdutos?.hasError ?? false) {
              print(controller.listaProdutos!.error);
              return Center(
                child: Text("Ocorreu um erro ao realizar essa requisição."),
              );
            }

            if (controller.listaProdutos?.value == null) {
              return Center(child: CircularProgressIndicator());
            }

            controller.listaProdutos?.value?.sort((produto1, produto2) => produto1.nome.toLowerCase().compareTo(produto2.nome.toLowerCase()));
            return ListView.builder(
              itemCount: controller.listaProdutos?.value?.length,
              itemBuilder: (context, index) {
                var listModels = controller.listaProdutos?.value;
                if (listModels != null) {
                  return CardProdutoWidget(
                    nomeProduto: listModels[index].nome,
                    valor: listModels[index].valor.toString(),
                    categoriaProduto: listModels[index].categoriaProduto.descricao,
                    tipoProduto: listModels[index].tipoProduto.descricao,
                    idProduto: listModels[index].id,
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushNamed("/AddProduto");
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      onWillPop: () async {
        var result = false;

        await showDialog(
            builder: (context) => AlertDialog(
                  content: Text("Voce deseja mesmo sair?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        result = true;
                        Modular.to.pop();
                      },
                      child: Text("Sim"),
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      child: Text("Nao"),
                    )
                  ],
                ),
            context: context);

        return result;
      },
    );
  }
}
