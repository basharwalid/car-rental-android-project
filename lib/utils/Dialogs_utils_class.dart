import 'package:flutter/material.dart';
class DialogUtils{
  static void showDialogeMessage({required String Message ,required BuildContext context}){
    showDialog(context: context, builder: (buildContext){
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 10,),
            Text(Message),
          ],
        ),
      );
    },
    barrierDismissible: false,
    );

  }

  static void hideDialogMessage ({required BuildContext context}){
    Navigator.pop(context);
  }

  static void showMessage ({required String message , required BuildContext context}){
    showDialog(context: context, builder: (context) {
        return AlertDialog(

        );
      }
    );
  }
}