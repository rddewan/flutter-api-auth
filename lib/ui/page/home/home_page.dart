

import 'package:flutter/material.dart';
import 'package:login_register/ui/widget/build_progress_bar.dart';
import 'package:login_register/ui/widget/build_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildScaffold(
      'Home', 
      Container(
        child: Column(
          children: [
            Text('Home'),         
          ],

        ),
      ), 
      null
    );
  }
}