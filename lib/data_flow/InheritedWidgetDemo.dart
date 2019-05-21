import 'package:flutter/material.dart';
import 'package:flutter_study/common/Master.dart';

class Counter {
  int value = 0;

  Counter({this.value});
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Counter count = Counter(value: 0);
  @override
  Widget build(BuildContext context) {
    return Master(
      title: "InheritedWidget",
      child: _InheritedStateContainer(
        counter: count,
        child: CounterDisplayer1(
          initCount: 1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          count.value += 1;
          setState(() {});
        },
      ),
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final Counter counter;
  final textStyle = TextStyle(fontSize: 20);

  //我们知道InheritedWidget总是包裹的一层，所以它必有child
  _InheritedStateContainer(
      {Key key, @required this.counter, @required Widget child})
      : super(key: key, child: child);

  //参考MediaQuery,这个方法通常都是这样实现的。如果新的值和旧的值不相等，就需要notify
  @override
  bool updateShouldNotify(_InheritedStateContainer oldWidget) {
    return true;
  }

  //4.模仿MediaQuery,提供一个of方法，来得到我们的State.
  static Counter of(BuildContext context) {
    //这个方法内，调用 context.inheritFromWidgetOfExactType
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .counter;
  }
}

class CounterDisplayer1 extends StatefulWidget {
  int initCount;
  CounterDisplayer1({@required int initCount}) : super() {
    print("====CounterDisplayer1======$initCount");
    this.initCount = initCount;
  }
  @override
  _CounterDisplayer1State createState() => _CounterDisplayer1State();
}

class _CounterDisplayer1State extends State<CounterDisplayer1> {
  int count;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    count = widget.initCount +
        (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
                as _InheritedStateContainer)
            .counter
            .value;

    print("======+${count}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Count is $count"),
        CounterDisplayer2(initCount: (widget.initCount + 1))
      ],
    );
  }
}

class CounterDisplayer2 extends StatelessWidget {
  final int initCount;

  CounterDisplayer2({this.initCount}) : super();

  @override
  Widget build(BuildContext context) {
    final count = initCount +
        (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
                as _InheritedStateContainer)
            .counter
            .value;
    return Column(
      children: <Widget>[
        Text("Count is $count"),
        CounterDisplayer3(initCount: (initCount + 1))
      ],
    );
  }
}

class CounterDisplayer3 extends StatelessWidget {
  final int initCount;

  CounterDisplayer3({this.initCount}) : super();

  @override
  Widget build(BuildContext context) {
    final count = initCount +
        (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
                as _InheritedStateContainer)
            .counter
            .value;
    return Text("Count is $count");
  }
}
