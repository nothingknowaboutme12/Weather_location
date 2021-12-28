import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_location/Screen/Location_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:weather_location/Services/Networking.dart';

const String Myapikey = "85c2ad87af51427fe745319365b7c285";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      NetworkHelper network = NetworkHelper(
          url: "http://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${Myapikey}&units=metric");
      var weatherdata=await network.getData();


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(wetherdata: weatherdata,),
        ),
      );
    } catch (E) {
      print(E.toString());

      await Geolocator.openLocationSettings();
      await Geolocator.openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
