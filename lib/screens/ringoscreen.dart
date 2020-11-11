import 'package:flutter/material.dart';

class RingoScreen extends StatelessWidget {
  static const String routeName = "/ringoscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ringo Screen"),
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: RaisedButton(
              child: Text("Home"),
              color: Colors.blue,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
