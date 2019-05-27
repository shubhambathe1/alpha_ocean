import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './dashboard.dart';


Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Not in stock'),
        content: const Text('This item is no longer available'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _phone = 'default';
  String _password = '';

  bool isTappedDown = false;

  final myPhoneController = TextEditingController();
  final myPasswordController = TextEditingController();

  @override
  initState() {
    super.initState();

    print("Reached");
    // getData();
  }

  //        body: {
//          'mobile': '911234567890',
//          'password': '123456',
//        },

  Future<String> userLogin() async {
    final response = await http.get(
      Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    // return postFromJson(response.body);
    List data = json.decode(response.body);
    debugPrint(data.toString());
    // print(_password);
  }

  Future<String> getData(BuildContext context) async {
    var body = {
      'mobile': _phone,
      'password': _password,
    };

    final response = await http.post(
        Uri.encodeFull(
            'http://portfolio.theaxontech.com/CI/alphaocean/userLogin'),
        headers: {
          // HttpHeaders.contentTypeHeader: 'application/json'
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(body),
        encoding: Encoding.getByName("utf-8"));
    // return postFromJson(response.body);

    final data = json.decode(response.body);
    debugPrint(data['status'].toString());

    if (data['status']) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DashboardScreen(),
          ));
    } else {

      _ackAlert(context);

      //print("DEAD");
//      AlertDialog(
//        title: Text('Alert'),
//        content: const Text('Sorry wrong credentials...'),
//        actions: <Widget>[
//          FlatButton(
//            child: Text('Ok'),
//            onPressed: () {
//              // Navigator.of(context).pop();
//              print("Cancelled");
//            },
//          ),
//        ],
//      );
    }
  }

  void _submitValues() {
//    setState(() {
//      _phone:
//      myPhoneController.value.text;
//      _password:
//      myPasswordController.value;
//    });

    debugPrint('data: $_phone + " ** " + $_password');
    // debugPrint('data: ' + myPhoneController.value.text);

    //log('data: $_phone');
    //print('data: $_phone');
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myPhoneController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
//                decoration: new BoxDecoration(color: Colors.red),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
//                    decoration: const BoxDecoration(color: Colors.red),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              padding: new EdgeInsets.all(20.0),
//                            decoration: const BoxDecoration(color: Colors.red),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Sign-In",
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                            ),
                            flex: 0,
                          ),
                          Expanded(
                            child: Container(
//                            decoration: const BoxDecoration(color: Colors.blue),
                              child: Center(
                                child: Image.asset(
                                  'images/wheel_logo.png',
                                  height: 130,
                                  width: 130,
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 30.0),

//                      decoration: const BoxDecoration(color: Colors.pink),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.red),
                                      // child: Text("Select Country Code"),
                                    ),
                                    flex: 0,
                                  ),
                                  Expanded(
                                    child: Container(
//                                      decoration: const BoxDecoration(
//                                          color: Colors.pink),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: TextFormField(
                                              controller: myPhoneController,
                                              onFieldSubmitted: (String value) {
                                                setState(() {
                                                  _phone = value;
                                                });
                                              },
//                                              validator: (value) {
//                                                if (value.isEmpty) {
//                                                  print("BACK");
//                                                  // return 'Please enter youu phone number';
//                                                }
//                                              },
//                                              onSaved: (value) {
//                                                setState(() {
//                                                  _phone = value;
//                                                });
//                                              },
                                              autofocus: false,
                                              maxLength: 12,
                                              style: new TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                // counterText: "",
//                                                enabledBorder:
//                                                    const OutlineInputBorder(
//                                                  borderSide: const BorderSide(
//                                                      color: Colors.white,
//                                                      width: 0.0),
//                                                ),
                                                icon: Icon(Icons.phone,
                                                    color: Colors.white),
                                                labelText: 'Mobile Number',
                                              ),
                                              keyboardType:
                                                  TextInputType.number),
                                        ),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
//                              decoration:
//                                  const BoxDecoration(color: Colors.teal),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.red),
                                      // child: Text("Select Country Code"),
                                    ),
                                    flex: 0,
                                  ),
                                  Expanded(
                                    child: Container(
//                                      decoration: const BoxDecoration(
//                                          color: Colors.pink),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: TextFormField(
                                            controller: myPasswordController,
                                            onFieldSubmitted: (String value) {
                                              setState(() {
                                                _password = value;
                                              });
                                            },
                                            obscureText: true,
                                            autofocus: false,
                                            maxLength: 10,
                                            style: new TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            decoration: InputDecoration(
//                                              enabledBorder:
//                                                  const OutlineInputBorder(
//                                                borderSide: const BorderSide(
//                                                    color: Colors.white,
//                                                    width: 0.0),
//                                              ),
                                              icon: Icon(Icons.vpn_key,
                                                  color: Colors.white),
                                              labelText: 'Password',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    flex: 3,
                                  ),
                                ],
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
//                                decoration:
//                                    const BoxDecoration(color: Colors.orange),

                                child: Center(
                              child: CupertinoButton(
                                child: new Container(
                                  width: 220.0,
                                  height: 52.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        new BorderRadius.circular(100.0),
                                  ),
                                  child: new Center(
                                    child: new Text(
                                      'Submit',
                                      style: new TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                                onPressed: () {

                                  //_ackAlert(context);

                                  // userLogin();
                                  getData(context);
//                                  setState(() {
//                                    print('hello');
//                                  });
//                                      Navigator.push(
//                                          context,
//                                          MaterialPageRoute(
//                                            builder: (BuildContext context) => DashboardScreen(),
//                                          ));
                                },
                              ),

//                                  child: InkWell(
//                                    onTap: () => print('hello'),
//                                    child: new Container(
//                                      width: 200.0,
//                                      height: 50.0,
//                                      decoration: new BoxDecoration(
//                                        color: Colors.white,
//                                        // border: new Border.all(color: Colors.white, width: 1.0),
//                                        borderRadius:
//                                            new BorderRadius.circular(100.0),
//                                      ),
//                                      child: new Center(
//                                        child: new Text(
//                                          'Submit',
//                                          style: new TextStyle(
//                                              fontSize: 20.0,
//                                              color: Colors.blue),
//                                        ),
//                                      ),
//                                    ),
//                                  ),

//                                      child: GestureDetector(
//                                        child: Scaffold(
//                                          body: Center(
//                                              child: Column(
//                                                mainAxisAlignment: MainAxisAlignment.center,
//                                                children: <Widget>[
//                                                  Text('Sumbit',
//                                                  style: TextStyle(
//                                                      fontSize: 30,
//                                                      fontWeight: FontWeight.bold,
//                                                      color: isTappedDown ? Colors.black.withOpacity(0.5) : Colors.black),
//                                              ),
//
//                                                ],
//                                              )
//                                          ),
//                                        ),
//                                        onTap: () {
//                                          print('Tapped');
//                                        },
//                                        onTapDown: (tapDownDetails) {
//                                          setState(() {
//                                            isTappedDown = true;
//                                          });
//                                        },
//                                        onLongPress: () {
//                                          print('Long Pressed');
//                                        },
//                                        onVerticalDragEnd: (DragEndDetails value) {
//                                          print('Swiped Vertically');
//                                        },
//                                        onHorizontalDragEnd: (DragEndDetails value) {
//                                          print('Swiped Horizontally');
//                                        },
//                                      ),
                            )),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: Container(
                      // decoration: const BoxDecoration(color: Colors.blue),
                      child: Center(
                        child: Text(
                          "Don't have a account? Register Here",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    flex: 1,
                  ),

                  // The InkWell Wraps our custom flat button Widget
                  InkWell(
                    // When the user taps the button, show a snackbar
                    onTap: () {
//                      Scaffold.of(context).showSnackBar(SnackBar(
//                        content: Text('Tap'),
//                      ));
                      print("Tapped");
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Flat Button'),
                    ),
                  ),
                ],
              ),
            )),
      ),

//      floatingActionButton: FloatingActionButton(
//        // When the user presses the button, show an alert dialog with the
//        // text the user has typed into our text field.
//        onPressed: () {
//          return showDialog(
//            context: context,
//            builder: (context) {
//              return AlertDialog(
//                // Retrieve the text the user has typed in using our
//                // TextEditingController
//                content: Text(myPasswordController.text),
//              );
//            },
//          );
//        },
//        tooltip: 'Show me the value!',
//        child: Icon(Icons.text_fields),
//      ),
    );
  }
}
