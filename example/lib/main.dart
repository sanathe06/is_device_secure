import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:is_device_secure/is_device_secure.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _isSecured ='Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String isSecured;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion =  await IsDeviceSecure.platformVersion ?? 'Unknown';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      isSecured =  "${await IsDeviceSecure.secure}";
    } on PlatformException {
      isSecured = 'Failed to get security status.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _isSecured = isSecured;
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
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('Is Secured on: $_isSecured'),
            ],
          ),
        ),
      ),
    );
  }
}
