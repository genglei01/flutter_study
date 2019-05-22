/**
  * ValueNotifier:ValueNotifier实例可以添加监听器，当ValueNotifier的值发生化时，会除非监听器。
  */
import 'package:flutter/material.dart';
import 'package:flutter_study/common/Master.dart';

class ValueNotifierDemo extends StatefulWidget {
  final ValueNotifier<int> count = ValueNotifier(0);

  ValueNotifierDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ValueNotifierDemoState createState() => _ValueNotifierDemoState();
}

class _ValueNotifierDemoState extends State<ValueNotifierDemo> {
  String strCount = "0";

  @override
  void initState() {
    super.initState();
    widget.count.addListener(() {
      setState(() {
        strCount = "${widget.count.value}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Master(
      title: "Value Notifier",
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                strCount,
                style: Theme.of(context).textTheme.display1,
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.count.value += 1;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     )
