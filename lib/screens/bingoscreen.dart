import 'package:flutter/material.dart';
import 'package:flutter_routing/screens/ringoscreen.dart';

class BingoScreen extends StatelessWidget {
  static const String routeName = "/bingoscreen";
  final String someDataString;

  BingoScreen({this.someDataString});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This leading icon button is not required, by default, back button will come. But if you want to customize, then you can follow like this
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orangeAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Bingo Screen"),
      ),
      body: Center(
        child: Container(
          color: Colors.blueAccent,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(someDataString),
              RaisedButton(
                child: Text("Ringo Screen pop and push"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.popAndPushNamed(context, RingoScreen.routeName);
                },
              ),
              SizedBox(height: 15),
              RaisedButton(
                child: Text("Ringo Screen push replacement"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RingoScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
