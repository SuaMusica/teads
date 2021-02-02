import 'package:flutter/material.dart';
import 'package:teads/teads/teads_ad_contained.dart';
import 'package:teads/teads/teads_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teads Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Teads Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final settings = TeadsAdSettings(
      debugModeEnabled: true,
      publisherSlotUrl: "http://teads.com",
    )..userConsent(
        subject: "SUBJECT_GDPR",
        consent: "CONSENTsldfjsdlfj",
        tcfVersion: TCFVersion.V2,
        sdkId: 1234567,
      );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TeadsAdContained(
              pid: 127547,
              settings: settings,
            ),
          ],
        ),
      ),
    );
  }
}
