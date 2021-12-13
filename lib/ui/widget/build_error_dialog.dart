import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildErrorDialog(BuildContext context, String title, String msg) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error,color: Colors.red),
            const SizedBox(width: 8.0,),
            Text(title)
          ],
        )),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(msg),
          ],
        ),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close,color: Colors.red,),
              label: const Text('close'))
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),bottomRight: Radius.circular(16.0))
        ),
        
      );
    });
}
