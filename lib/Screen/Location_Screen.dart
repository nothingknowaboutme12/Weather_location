import 'package:flutter/material.dart';
import 'package:weather_location/Screen/City_screen.dart';
import 'package:weather_location/Services/Networking.dart';
import 'package:weather_location/Services/weather.dart';

const String Myapikey = "85c2ad87af51427fe745319365b7c285";

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.wetherdata});

  final wetherdata;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel Model = WeatherModel();
  late int Temperature;
  late int conditionId;
  late String MyCity;
  late String weatherIcon;
  late String WeatherMessage;
  updateui(var weatherData) {
    setState(() {
      if (weatherData == null) {
        Temperature = 0;
        weatherIcon = "Error";
        WeatherMessage = "Unable to get Location in";
        MyCity = "your Location";
      }
      double DoubleTemperatur = weatherData["main"]["temp"];
      Temperature = DoubleTemperatur.toInt();
      conditionId = weatherData["weather"][0]["id"];
      weatherIcon = Model.getWeatherIcon(conditionId);
      WeatherMessage = Model.getMessage(Temperature);
      MyCity = weatherData["name"];
    });
  }

  @override
  void initState() {
    super.initState();
    updateui(widget.wetherdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/location_background.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () {
                        updateui(widget.wetherdata);
                      },
                      child: Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var nextpagevalue = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => City_Screen(),
                          ),
                        );
                        if (nextpagevalue != null) {
                          var citymodel =
                              await Model.GetCityLocation(nextpagevalue);
                          setState(() {
                            updateui(citymodel);

                          });

                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${Temperature.toString()}°c',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                    Text(
                      weatherIcon.toString(),
                      style: TextStyle(
                        fontSize: 90,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 10),
                  child: Text(
                    '$WeatherMessage in $MyCity',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
