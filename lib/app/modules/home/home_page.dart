import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/modules/home/home_controller.dart';
import '../../../app/modules/home/home_module.dart';
import 'widgets/card_produto/card_produto_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeModule.to.get();

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
                Modular.to.pushReplacementNamed("/auth");
              },
            )
          ],
        ),
        body: Observer(
          builder: (context) {
            if (homeController.listaProdutos.hasError) {
              return Center(
                child: Text("Ocorreu um erro ao realizar essa requisição."),
              );
            }

            if (homeController.listaProdutos.value == null) {
              return Center(child: CircularProgressIndicator());
            }

            homeController.listaProdutos.value.sort((produto1, produto2) =>
                produto1.nome
                    .toLowerCase()
                    .compareTo(produto2.nome.toLowerCase()));
            return ListView.builder(
              itemCount: homeController.listaProdutos.value.length,
              itemBuilder: (context, index) {
                return CardProdutoWidget(
                  nomeProduto: homeController.listaProdutos.value[index].nome,
                  valor: homeController.listaProdutos.value[index].valor
                      .toString(),
                  categoriaProduto: homeController
                      .listaProdutos.value[index].categoriaProduto.descricao,
                  tipoProduto: homeController
                      .listaProdutos.value[index].tipoProduto.descricao,
                  idProduto: homeController.listaProdutos.value[index].id,
                );
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
            context: context,
            child: AlertDialog(
              content: Text("Voce deseja mesmo sair?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    result = true;
                    Modular.to.pop();
                  },
                  child: Text("Sim"),
                ),
                FlatButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: Text("Nao"),
                )
              ],
            ));

        return result;
      },
    );
  }
}
