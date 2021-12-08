import 'package:flutter/material.dart';

void buildLoadingMeterialDialog(
    BuildContext context, String title, String description) {
  showDialog(
    barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),bottomRight: Radius.circular(16.0))
            ),
            title: Center(child: Text(title)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [Text(description), const CircularProgressIndicator()],
            ));
      });
}

void hideLoadingMeterialDialog(BuildContext context) {
  Navigator.pop(context);
}
