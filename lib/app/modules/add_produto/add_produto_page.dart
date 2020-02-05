import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_hasura/app/modules/add_produto/add_produto_controller.dart';
import 'package:loja_hasura/app/modules/add_produto/add_produto_module.dart';
import 'package:loja_hasura/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:loja_hasura/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:loja_hasura/app/shared/widgets/label/label_widget.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"})
      : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState extends State<AddProdutoPage> {
  AddProdutoController controller = AddProdutoModule.to.get();

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
                  TextField(
                    onChanged: controller.setDescricao,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                      hintText: "Descricao do Produto",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LabelWidget(
                    title: "Valor:",
                  ),
                  TextField(
                    onChanged: controller.setValor,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                      hintText: "Valor",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LabelWidget(
                    title: "Categoria do Produto:",
                  ),
                  Observer(
                    builder: (BuildContext context) {
                      if (controller.tipoProduto == null) {
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
                        items: controller.tipoProduto.categoriaProduto
                            .map((data) => Model(data.id, data.descricao))
                            .toList(),
                        onChange: (tipo) => controller.setSelectedCategoria(
                            TipoECategoriaDto(
                                id: tipo.id, descricao: tipo.descricao)),
                        itemSelecionado: null,
                      );
                    },
                  ),
                  LabelWidget(
                    title: "Tipo Produto:",
                  ),
                  Observer(
                    builder: (BuildContext context) {
                      if (controller.tipoProduto == null) {
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
                        items: controller.tipoProduto.tipoProduto
                            .map((data) => Model(data.id, data.descricao))
                            .toList(),
                        onChange: (tipo) => controller.setSelectedTipo(
                            TipoECategoriaDto(
                                id: tipo.id, descricao: tipo.descricao)),
                        itemSelecionado: null,
                      );
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
                          Navigator.of(context).pop();
                        } else {
                          showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Text("Erro ao tentar salvar o produto!"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Fechar"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
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
