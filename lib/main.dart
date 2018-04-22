import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Internationalization
import 'app_localizations.dart';
import 'widgets/thing/thing_localizations.dart';

// Googlemaps
import 'widgets/map/trackers_overview.dart';

// Start op the application
void main() {
  runApp(new TrackerApp());
}

// Innovate Tracker Application
class TrackerApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        const TrackerLocalizationsDelegate(),
        const ThingLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('nl', 'NL'), // Dutch
        // ... other locales the app supports
      ],
      title: 'InnovateNow Tracker',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'InnovateNow Tracker'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // Application title 
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // Create BottomNavigationBar Item list
    List<BottomNavigationBarItem> bottomNavigationBarItems = new List();
    bottomNavigationBarItems.add(new BottomNavigationBarItem(
        icon: new Icon(FontAwesomeIcons.globe),
        title: new Text(AppLocalizations.of(context).home) ));
    bottomNavigationBarItems.add(new BottomNavigationBarItem(
        //icon: new Icon(FontAwesomeIcons.registeredO),
        icon: new Icon(FontAwesomeIcons.qrcode),
        title: new Text(ThingLocalizations.of(context).things) ));
    bottomNavigationBarItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.alarm),
        title: new Text(AppLocalizations.of(context).alerts) ));
    bottomNavigationBarItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.settings),
        title: new Text(AppLocalizations.of(context).settings) ));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: new Text(widget.title),
        title: new Text(AppLocalizations.of(context).title)
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              new TrackerOverview()
            ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) { setState((){ _currentIndex = index; }); },
        items: bottomNavigationBarItems,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
