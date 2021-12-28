import 'package:flutter/material.dart';
// import 'package:location/screen/loading_screen.dart';
import 'package:weather_location/Screen/Loading_Screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
