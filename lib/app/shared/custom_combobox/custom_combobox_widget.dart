import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CustomComboboxWidget extends StatelessWidget {
  final List<Model> items;
  final void Function(Model) onChange;
  final Model? itemSelecionado;
  final String? errorText;

  const CustomComboboxWidget({
    Key? key,
    required this.items,
    required this.onChange,
    required this.itemSelecionado,
    this.errorText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FindDropdown<Model>(
          items: items,
          onChanged: (item) {
            if (item != null) {
              onChange(item);
            }
          },
          selectedItem: itemSelecionado,
          dropdownBuilder: (_, model) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(width: 2, color: Theme.of(context).primaryColor)),
              child: model?.id == null
                  ? ListTile(
                      title: Text(
                        "Selecione um item",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  : ListTile(
                      title: Text(
                        model?.descricao ?? 'Não informado',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
            );
          },
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorText ?? 'Alguma coisa não está certa',
              style: TextStyle(color: Colors.red),
            ),
          ),
        if (errorText == null)
          SizedBox(
            height: 20,
          )
      ],
    );
  }
}

class Model {
  final String id;
  final String descricao;

  Model(this.id, this.descricao);

  @override
  String toString() => descricao.toString();

  @override
  operator ==(o) => o is Model && o.id == id;

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}
