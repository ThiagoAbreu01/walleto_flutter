// import 'package:flutter/material.dart';

// class CustomDropdownSearch extends StatefulWidget {
//   final List<dynamic> lista;

//   const CustomDropdownSearch({super.key, required this.lista});

//   @override
//   State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
// }

// class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownSearch<String>(
//       // key: dropDownKey,
//       selectedItem: 'Selecione um fornecedor',
//       items: (filter, infiniteScrollProps) =>
//           widget.list.map((e) => e.nome).toList(),
//       decoratorProps: DropDownDecoratorProps(
//         decoration: InputDecoration(
//           labelText: 'Examples for: ',
//           border: OutlineInputBorder(),
//         ),
//       ),
//       popupProps: PopupProps.dialog(
//         showSearchBox: true,
//         searchFieldProps: TextFieldProps(
//           decoration: InputDecoration(labelText: 'Buscar fornecedor'),
//         ),
//         itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
//           title: Text(item),
//           subtitle: Text(
//             produtos.firstWhere((p) => p.nome == item).descricao,
//           ),
//         ),
//       ),
//       onChanged: (value) {
//         if (value != null) {
//           final produto = produtos.firstWhere((p) => p.nome == value);
//           print('Produto selecionado: ${produto.nome}');
//           print('Descrição: ${produto.descricao}');
//         }
//       },
//       itemAsString: (item) => item,
//     );
//   }
// }
