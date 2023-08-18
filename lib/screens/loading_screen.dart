import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData,);
      }));


    }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 100.0,
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
              color: Colors.transparent,
            ),
            Center(
              child: Text('CLIMA☁️',
                style: kLoadingTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
