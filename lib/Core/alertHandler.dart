import 'package:flutter/material.dart';

//example usage: alertHandler("Lütfen arama kutusuna metin girin", context, state, false, false, (){});
void alertHandler(
  String content,
  context,
  state,
  bool buttonClear,
  bool buttonSure,
  void Function() onPressed,
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
  Widget _buttonSure = TextButton(
      onPressed: onPressed,
      child: Text("Eminim"),
      style: TextButton.styleFrom(primary: Theme.of(context).primaryColor));

  //AlertDialog Widget
  AlertDialog modularAlert = AlertDialog(
    content: Text(
      content,
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    actions: [
      buttonClear ? _buttonClear : null,
      buttonSure ? _buttonSure : null,
      _buttonback,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return modularAlert;
      });
}
