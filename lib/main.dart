import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('flutter_button'),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
  );


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: _elevatedButton(context),
          ),
          Container(
            child: _outlinedButton(),
          ),
          Container(
            child: _TextButton(),
          ),
        ],
      ),
    );
  }

  ElevatedButton _elevatedButton(BuildContext context){
    return ElevatedButton(
        child:
        Text('ElevatedButton'),
        style: buttonStyle,
        onPressed: (){
          showSnackbar(context);
        }
    );
  }
  OutlinedButton _outlinedButton(){
    return OutlinedButton(
      child: Text('OutlinedButton'),
      style: buttonStyle,
      onPressed: (){}
    );
  }
  TextButton _TextButton(){
    return TextButton(
        child: Text('TextButton'),
        style: buttonStyle,
        onPressed: (){}
    );
  }

  void showSnackbar(BuildContext context){
    final snackBar = SnackBar(
      content: Text('Hi, I am SnackBar'),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      action: SnackBarAction(
        label: "Toast訊息",
        textColor: Colors.white,
        onPressed: ()=> Fluttertoast.showToast(
            msg: '你按下SnackBar',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 20
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}