import 'package:flutter/material.dart';

buildScaffold(String title, Widget widget, FloatingActionButton? fab) =>
    Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(child: widget),
      floatingActionButton: fab,
    );
