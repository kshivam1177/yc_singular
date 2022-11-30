import 'package:flutter/material.dart';
import 'package:yc_singular/yc_singular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _ycSingularPlugin = YcSingular();
  String _deeplinks = "";

  @override
  void initState() {
    super.initState();
    _ycSingularPlugin.onDeeplink((value) {
      _deeplinks += value.toString();
      _deeplinks += "\n";
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Received DeepLinks \n$_deeplinks'),
        ),
      ),
    );
  }
}
