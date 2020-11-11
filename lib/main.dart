import 'package:flutter/material.dart';
import 'package:flutter_routing/screens/bingoscreen.dart';
import 'package:flutter_routing/screens/dingoscreen.dart';
import 'package:flutter_routing/screens/pingoscreen.dart';
import 'package:flutter_routing/screens/ringoscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyHomePage.routeName,
      // routes: <String, WidgetBuilder>{},
      onGenerateRoute: (RouteSettings settings) {
        print("Generate Route Called");
        var screen;
        String routeName = settings.name;
        switch (routeName) {
          case MyHomePage.routeName:
            screen = MyHomePage();
            break;
          case BingoScreen.routeName:
            screen = BingoScreen(someDataString: settings.arguments);
            break;
          case DingoScreen.routeName:
            screen = DingoScreen(someDataString: settings.arguments);
            break;
          case PingoScreen.routeName:
            screen = PingoScreen();
            break;
          case RingoScreen.routeName:
            screen = RingoScreen();
            break;
        }

        return MaterialPageRoute(builder: (context) => screen);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/";
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Navigation With Data to Next Route/Page"),
              SizedBox(height: 15),
              RaisedButton(
                child: Text("Navigator Push"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BingoScreen(
                        someDataString: "Hello Bingo !!!",
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              RaisedButton(
                child: Text("Navigator Push Named"),
                color: Colors.cyan,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.pushNamed(context, DingoScreen.routeName,
                      arguments: "Hey Dingo !!!");
                },
              ),
              Text("Navigation With No Data to Next Route/Page"),
              SizedBox(height: 15),
              RaisedButton(
                child: Text("Navigator Push"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PingoScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              RaisedButton(
                child: Text("Navigator Push Named"),
                color: Colors.cyan,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.pushNamed(context, RingoScreen.routeName);
                },
              ),
              Text("Pop from Home screen, with no pop available"),
              SizedBox(height: 15),
              RaisedButton(
                child: Text("POP"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    print('Yes, pop possible');
                    Navigator.pop(context);
                  } else {
                    print('end of navigation, no pop');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
