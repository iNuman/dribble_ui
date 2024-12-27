import 'package:flutter/material.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancel",
      required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Center(
              child: Container(
                height: 240,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
                child: const SizedBox.expand(child: FlutterLogo()),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: okBtnFunction(),
                child: Text(okBtnText),
              ),
              ElevatedButton(child: Text(cancelBtnText), onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }
}
