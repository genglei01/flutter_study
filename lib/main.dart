import 'package:flutter/material.dart';
import 'package:flutter_study/data_flow/ValueNotifierDemo.dart';
import 'package:flutter_study/common/Master.dart';
import 'package:flutter_study/data_flow/InheritedWidgetDemo.dart'
    as InheritedWidget_Demo;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Study'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Master(
        child: ListView(
      children: <Widget>[
        this._buildListTitle(context, "Value Notifier", ValueNotifierDemo()),
        this._buildListTitle(
            context, "InheritedWidget", InheritedWidget_Demo.Home()),
      ],
    ));
    ;
  }

  _buildListTitle(BuildContext context, String title, Widget target) {
    return ListTile(
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => target));
        });
  }
}
