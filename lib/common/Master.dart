import 'package:flutter/material.dart';

class Master extends StatelessWidget {
  final Widget child;
  final Widget floatingActionButton;

  Master({this.child, this.floatingActionButton}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Study"),
      ),
      body: this.child,
      floatingActionButton: this.floatingActionButton,
    );
  }
}
