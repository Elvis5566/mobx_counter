import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_counter/counter.dart';
import 'package:mobx/mobx.dart';

class CounterExample extends StatefulWidget {
  const CounterExample();

  @override
  CounterExampleState createState() => CounterExampleState();
}

class CounterExampleState extends State<CounterExample> {
  final Counter counter = Counter();

  CounterExampleState() {
    autorun((_){
      print(counter.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
                builder: (_) => Text(
                  '${counter.value}',
                  style: const TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
