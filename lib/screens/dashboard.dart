import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Screen'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Back To Previous Screen'),
            color: Theme.of(context).primaryColor,
//            textColor: Colors.white,
            onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}