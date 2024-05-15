import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class FlutterDeepLinking extends StatefulWidget {
  @override
  _FlutterDeepLinkingState createState() => _FlutterDeepLinkingState();
}

class _FlutterDeepLinkingState extends State<FlutterDeepLinking> {
  String? deepLinkURL = "";

  @override
  void initState() {
    initialLink().then((value) => this.setState(() {
          deepLinkURL = value;
        }));
    super.initState();
  }

  Future<String?> initialLink() async {
    try {
      final initialLink = await getInitialLink();
      return initialLink;
    } on PlatformException catch (exception){
      log(exception.message ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Deep Linking Sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(deepLinkURL  ?? ""),
          ],
        ),
      ),
    );
  }
}
