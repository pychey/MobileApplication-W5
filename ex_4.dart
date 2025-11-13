import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum WeatherType {
  cloudy('images/ex4/cloudy.png'),
  sunny('images/ex4/sunny.png'),
  sunnyCloudy('images/ex4/sunnyCloudy.png'),
  veryCloudy('images/ex4/veryCloudy.png');

  final String image;

  const WeatherType(this.image);
}

enum CityWeather {
  phnomPenh(cityName: 'Phnom Penh', currentTemp: 12.2, minTemp: 10.0, maxTemp: 30.0, weatherType: WeatherType.cloudy),
  paris(cityName: 'Paris', currentTemp: 22.2, minTemp: 10.0, maxTemp: 40.0, weatherType: WeatherType.sunny),
  rome(cityName: 'Rome', currentTemp: 45.2, minTemp: 10.0, maxTemp: 40.0, weatherType: WeatherType.sunnyCloudy),
  toulouse(cityName: 'Toulouse', currentTemp: 45.2, minTemp: 10.0, maxTemp: 40.0, weatherType: WeatherType.veryCloudy);

  final String cityName;
  final double currentTemp;
  final double minTemp;
  final double maxTemp;
  final WeatherType weatherType;

  const CityWeather({ required this.cityName, required this.currentTemp, required this.minTemp, required this.maxTemp, required this.weatherType });

  String toCelsius(double temp) {
    return '${temp.toString()} °C';
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        actions: [Icon(Icons.menu, color: Color(0xeeffffff)), Gap(30)],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(40),
        children: [
          WeatherCard(cityWeather: CityWeather.phnomPenh, startColor: Color(0xffc979ee), endColor: Color(0xffa27ef0)),
          WeatherCard(cityWeather: CityWeather.paris, startColor: Color(0xff6fe8cd), endColor: Color(0xff6ee1be)),
          WeatherCard(cityWeather: CityWeather.rome, startColor: Color(0xffeb6595), endColor: Color(0xffe85a7e)),
          WeatherCard(cityWeather: CityWeather.toulouse, startColor: Color(0xfff2b06e), endColor: Color(0xffe9c099))
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final CityWeather cityWeather;
  final Color startColor;
  final Color endColor;

  const WeatherCard({
    super.key,
    required this.cityWeather,
    required this.startColor,
    required this.endColor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [startColor, endColor])
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(cityWeather.weatherType.image),
                ),
                Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cityWeather.cityName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
                    Text('Min  ${cityWeather.toCelsius(cityWeather.minTemp)}', style: TextStyle(fontSize: 12, color: Colors.white)),
                    Text('Max  ${cityWeather.toCelsius(cityWeather.maxTemp)}', style: TextStyle(fontSize: 12, color: Colors.white)),
                  ],
                )
              ],
            ),
            Text(cityWeather.toCelsius(cityWeather.currentTemp), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white))
          ],
        ),
      )
    );
  }
}