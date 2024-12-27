import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../pages/edit_profile.dart';
import '../widgets/profile_widget.dart';

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
      builder: (BuildContext dialogContext) { // Use dialogContext here
        return AlertDialog(
          title: Text(title),
          content: Text("Buy VIP version of the profile"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => {
                okBtnFunction(),
                Navigator.pop(dialogContext)
              }, // Pass the function reference correctly
              child: Text(okBtnText),
            ),
            ElevatedButton(
              child: Text(cancelBtnText),
              onPressed: () => Navigator.pop(dialogContext),
            ),
          ],
        );
      },
    );
  }

}
