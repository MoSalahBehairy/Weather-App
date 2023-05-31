import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName
      });

  //  ده Named constructor بيبنيلى ال object عن طريق بيانات جيالى من على النت اللى جايه من json
  // وهوا مخصص اصلا للحاجة دى

  // ال factory constructor هوا Named Constructor بردوا بس بيعملreturn ل object انا اللى بانيه هنا
  factory WeatherModel.fromJson( dynamic data) {
    // انا كدا دمجت حاجتين ببعض دمجت ال constructor بتاعى العادى
    // بال named constructor اللى بيهندل البيانات اللى جيالى من على النت
    var jsonData = data['forecast']['forecastday'][0]['day'];
    // ده لو انا هعمل Named Constructor
    //   date= data['location']['localtime'];
    //   temp= jsonData['avgtemp_c'];
    //   maxTemp= jsonData['maxtemp_c'];
    //   minTemp= jsonData['mintemp_c'];
    // weatherStateName= jsonData['condition']['text'];
    return WeatherModel(
        // date: DateTime.parse(data['created']),
        date: DateTime.parse( data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  // دى بتستدعى لما اجى اعمل برنت لل weather على طول
  @override
  String toString() {
    return 'temp = $temp  minTemp = $minTemp  date = $date';
  }

  // String getImage() {
  //   if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
  //     return 'assets/images/cloudy.png';
  //   } else if (weatherStateName == 'Sleet' ||
  //       weatherStateName == 'Snow' ||
  //       weatherStateName == 'Hail') {
  //     return 'assets/images/snowy.png';
  //   } else if (weatherStateName == 'Heavy Cloud') {
  //     return 'assets/images/cloudy.png';
  //   } else if (weatherStateName == 'Light Rain' ||
  //       weatherStateName == 'Heavy Rain' ||
  //       weatherStateName == 'Showers') {
  //     return 'assets/images/raining.png';
  //   } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder'){
  //     return 'assets/images/thunderstorm.png';
  //   } else if (weatherStateName == 'Sunny' ){
  //     return 'assets/images/sun.png';
  //   } else {
  //     return 'assets/images/clear-sky.png';
  //
  //   }
  // }

  String getImage() {
    if (weatherStateName == 'Sunny')
    {
      return 'assets/images/sun.png';
    } else if (

    weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return 'assets/images/rainy.png';


    } else if (weatherStateName == 'Partly cloudy' || weatherStateName == 'cloudy' ||  weatherStateName == 'Heavy Cloud' ) {
      return 'assets/images/cloudy.png';
    }

    else {
      return 'assets/images/clear.png';
    }
  }

 //  MaterialColor getThemeColor(){
 //    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'){
 //      return Colors.blue;
 //    } else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail'){
 //      return Colors.blue;
 //    } else if (weatherStateName == 'Heavy Cloud'){
 //      return Colors.blueGrey;
 //    } else if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers'){
 //      return Colors.blue;
 //    } else {
 //      return Colors.orange;
 //    }
 // }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny')
       {
      return Colors.orange;
    } else if (

    weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else
    if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else if (weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Cloudy')
       {
      return Colors.blueGrey;
    }


    else {
      return Colors.lightBlue;
    }
  }

}
