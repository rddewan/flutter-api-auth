import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildProgressBar() => Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [CircularProgressIndicator()],
  ),
);
