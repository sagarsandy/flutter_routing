import 'package:flutter/material.dart';
import 'package:flutter_routing/main.dart';
import 'package:flutter_routing/screens/pingoscreen.dart';

class DingoScreen extends StatelessWidget {
  static const String routeName = "/dingoscreen";
  final String someDataString;

  DingoScreen({this.someDataString});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dingo Screen"),
      ),
      body: Center(
        child: Container(
          color: Colors.deepOrangeAccent,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Text(someDataString ?? "Hello"),
              RaisedButton(
                child: Text("Pingo Screen as Home"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  // This will put pingo screen as new home(first) screen
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    PingoScreen.routeName,
                    (route) => false,
                  );

                  // This will put home screen as first screen and then pingo screen
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   PingoScreen.routeName,
                  //   ModalRoute.withName(MyHomePage.routeName),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
