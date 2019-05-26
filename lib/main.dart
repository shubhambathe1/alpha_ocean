import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        hintColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _phone = 'default';
  String _password = '';
  int _counter = 0;

  bool isTappedDown = false;

  final myPhoneController = TextEditingController();
  final myPasswordController = TextEditingController();

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
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
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
                                              maxLength: 10,
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
                                  setState(() {
                                    print('hello');
                                  });
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
