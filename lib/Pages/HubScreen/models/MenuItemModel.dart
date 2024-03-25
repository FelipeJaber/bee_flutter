import 'package:flutter/cupertino.dart';

class MenuItemModel{

  String nome;
  IconData icon;
  List<MenuItemModel> subItens;
  bool isExpanded;

  MenuItemModel(this.nome, this.icon, this.subItens, this.isExpanded);

}