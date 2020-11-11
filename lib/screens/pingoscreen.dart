import 'package:flutter/material.dart';

class PingoScreen extends StatelessWidget {
  static const String routeName = "/pingoscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pingo Screen"),
      ),
      body: Center(
        child: Container(
          color: Colors.purple,
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
