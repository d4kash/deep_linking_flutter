import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class FlutterDeepLinking extends StatefulWidget {
  @override
  _FlutterDeepLinkingState createState() => _FlutterDeepLinkingState();
}

class _FlutterDeepLinkingState extends State<FlutterDeepLinking> {
  late AppLinks _appLinks;
  String? deepLinkURL = "";
  StreamSubscription<Uri>? _linkSubscription;

  @override
 @override
  void initState() {
    super.initState();

    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialLink();
    if (appLink != null) {
      // print('getInitialAppLink: $appLink');
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      // print('onAppLink: $uri');
      setState(() {
      deepLinkURL = uri.toString();
      });
    });
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
