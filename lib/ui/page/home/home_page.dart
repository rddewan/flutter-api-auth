

import 'package:flutter/material.dart';
import 'package:login_register/ui/widget/build_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  @override
  Widget build(BuildContext context) {
    return BuildScaffold(
      'Home', 
      Column(
        children: const [
          Text('Home'),         
        ],

      ), 
      null   
    );
  }
}
