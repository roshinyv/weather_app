import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/pages/homepage.dart';
import 'package:weather_app/services/forecast_services.dart';

import 'package:weather_app/services/weather_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String location = 'Null, Press Button';
  String Address = 'search';

  @override
  void initState() {
    super.initState();
    getlocationdata();
  }

  Future<void> getlocationdata() async {
    Position position = await _getGeoLocationPosition();
    // location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    double loclat = position.latitude;
    double loclong = position.longitude;

    GetAddressFromLatLong(position);
    var latitude = loclat;
    var longitude = loclong;
    String apiKey = "d9276ce4bba094ba91ecd453044774c7";

    WeatherRepo weatherJson = WeatherRepo(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey");

    var weatherDatas = await weatherJson.getWeatherData();

    ForecastRepo forecastDatas = ForecastRepo(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey");

    var forecastJson = await forecastDatas.getForecastData();
    // print(forecastJson.toString());
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Homepage(
          weatherDecode: weatherDatas,
          forecastDecode: forecastJson,
        );
      },
    ));
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
