import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_study/common/Master.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final _ctrl = StreamController<int>();
  int _count = 0;

  @override
  void dispose() {
    super.dispose();
    _ctrl.close();
  }

  @override
  Widget build(BuildContext context) {
    return Master(
        child: Center(
            child: StreamBuilder<int>(
                stream: _ctrl.stream,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text('You hit me:${snapshot.data} times');
                })),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _ctrl.sink.add(++_count);
          },
        ));
  }
}
