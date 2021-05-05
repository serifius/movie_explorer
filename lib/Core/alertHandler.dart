import 'package:flutter/material.dart';
import 'package:movie_explorer/States/states.dart';

//example usage: alertHandler("Lütfen arama kutusuna metin girin", context, null, false, false, null);
void alertHandler(
  String content,
  context,
  FavoritesList state,
  bool buttonClear,
) {
  //Buttons
  Widget _buttonback = TextButton(
      onPressed: () => Navigator.of(context).pop(), child: Text("Geri"));

  Widget _buttonClear = TextButton(
      onPressed: () {
        state.clear();
        Navigator.of(context).pop();
      },
      child: Text("Temizle"),
      style: TextButton.styleFrom(primary: Colors.red));

  //AlertDialog Widget
  AlertDialog modularAlert = AlertDialog(
    content: Text(
      content,
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    actions: [
      buttonClear ? _buttonClear : null,
      _buttonback,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return modularAlert;
      });
}
