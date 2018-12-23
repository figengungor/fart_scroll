import 'package:flutter/material.dart';
import 'package:fart_scroll/fart_scroll.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fart_scroll Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with FartScrollMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fart_scroll Demo'),
      ),
      body: ListView.builder(
          controller: fartScrollController,
          itemCount: 500,
          itemBuilder: (_, index) {
            return ListTile(title: Text("Item $index"));
          }),
    );
  }
}
