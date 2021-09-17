import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  BetterPlayerController? control;
  BetterPlayerConfiguration? controller;
  BetterPlayerControlsConfiguration? configuration;

  @override
  void initState() {
    super.initState();
    configuration = BetterPlayerControlsConfiguration(
      enableOverflowMenu: false,
    );
    BetterPlayerDataSource source = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');
    control = BetterPlayerController(BetterPlayerConfiguration(),
        betterPlayerDataSource: source);
    control!.addEventsListener((event) => print('evtnt is' + event.toString()));
    controller = BetterPlayerConfiguration(
      controlsConfiguration: configuration!,
      allowedScreenSleep: false,
      autoPlay: false,
      placeholderOnTop: false,
      aspectRatio: 16 / 9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(
                  controller: control!,
                )),
          ],
        ),
      ),
    );
  }
}
