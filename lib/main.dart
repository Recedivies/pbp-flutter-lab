import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicat ion.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = "GENAP";

  void _changeTextHandler() {
    if (_counter % 2 == 0) {
      _text = "GENAP";
    } else {
      _text = "GANJIL";
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _changeTextHandler();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) _counter--;
      _changeTextHandler();
    });
  }

  MaterialColor _colorTextHandler() {
    if (_text == "GENAP") {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  bool _removeVisibilityHandler() {
    if (_counter == 0) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const NavigationDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _text,
                style: TextStyle(color: _colorTextHandler()),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                visible: _removeVisibilityHandler(),
                child: FloatingActionButton(
                  heroTag: "btn-decrement",
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ),
              FloatingActionButton(
                heroTag: "btn-increment",
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ));
  }
}
