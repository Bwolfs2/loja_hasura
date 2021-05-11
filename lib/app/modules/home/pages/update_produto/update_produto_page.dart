import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../app/shared/widgets/label/label_widget.dart';
import '../../../../modules/add_produto/models/tipo_categoria_produto_dto.dart';
import '../../../../modules/home/pages/update_produto/update_produto_controller.dart';
import '../../../../shared/custom_combobox/custom_combobox_widget.dart';
import '../../home_module.dart';

class UpdateProdutoPage extends StatefulWidget {
  final String id;
  final String title;
  UpdateProdutoPage({Key key, this.title = "UpdateProduto", @required this.id})
      : super(key: key);

  @override
  _UpdateProdutoPageState createState() => _UpdateProdutoPageState(id);
}

class _UpdateProdutoPageState extends State<UpdateProdutoPage> {
  final String id;
  _UpdateProdutoPageState(this.id);
  UpdateProdutoController controller;
  @override
  void initState() {
    controller = HomeModule.to.get<UpdateProdutoController>(params: {"id": id});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height - 250,
            right: -50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 200,
            right: 50,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 150,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LabelWidget(
                    title: "Descricao:",
                  ),
                  Observer(
                    builder: (context) {
                      return TextField(
                        onChanged: controller.setDescricao,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        controller: controller.descricaoController,
                        decoration: InputDecoration(
                            hintText: "Descricao do Produto",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            errorText: controller.descricaoError),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LabelWidget(
                    title: "Valor:",
                  ),
                  Observer(
                    builder: (context) {
                      return TextField(
                        controller: controller.valorController,
                        onChanged: controller.setValor,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        decoration: InputDecoration(
                            hintText: "Valor",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            errorText: controller.valorError),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LabelWidget(
                    title: "Categoria do Produto:",
                  ),
                  Observer(
                    builder: (context) {
                      if (controller.updatedProduto == null) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ));
                      }

                      return CustomComboboxWidget(
                          items: controller.updatedProduto.categoriaProduto
                              .map((data) => Model(data.id, data.descricao))
                              .toList(),
                          onChange: (tipo) => controller.setSelectedCategoria(
                              TipoECategoriaDto(
                                  id: tipo.id, descricao: tipo.descricao)),
                          itemSelecionado: controller.selectedCategoria == null
                              ? controller.selectedCategoria
                              : Model(controller.selectedCategoria.id,
                                  controller.selectedCategoria.descricao),
                          errorText: controller.selectedCategoriaError);
                    },
                  ),
                  LabelWidget(
                    title: "Tipo Produto:",
                  ),
                  Observer(
                    builder: (context) {
                      if (controller.updatedProduto == null) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ));
                      }
                      return CustomComboboxWidget(
                          items: controller.updatedProduto.tipoProduto
                              .map((data) => Model(data.id, data.descricao))
                              .toList(),
                          onChange: (tipo) => controller.setSelectedTipo(
                              TipoECategoriaDto(
                                  id: tipo.id, descricao: tipo.descricao)),
                          itemSelecionado: controller.selectedTipo == null
                              ? null
                              : Model(controller.selectedTipo.id,
                                  controller.selectedTipo.descricao),
                          errorText: controller.selectedTipoError);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        var result = await controller.salvar();

                        if (result) {
                          Modular.to.pop();
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context)=>AlertDialog(
                                content:
                                Text("Erro ao tentar salvar o produto!"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Fechar"),
                                    onPressed: () {
                                      Modular.to.pop();
                                    },
                                  )
                                ],
                              ));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Salvar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
