
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({ this.updateUi});

  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Search a City'),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (data)
            {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              // هنا كدا انا بستخدم الداتا اللى رجعالى وبعملها save
         WeatherModel? weather = await service.getWeather(cityName: cityName!);
         Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
         Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
             Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),

              label: Text('search'),
              suffixIcon: GestureDetector(
                onTap: () async
                {
                  WeatherService service = WeatherService();
                  // هنا كدا انا بستخدم الداتا اللى رجعالى وبعملها save
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                  Navigator.pop(context);
                },
                  child: Icon(Icons.search)),
              hintText: 'Enter a city',
              hintStyle:TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

// void main ()
// {
//
//   print (createOrderMessage());
// }
//
// dynamic createOrderMessage (){
//   var order = fetchUserOrder();
//   return 'Your Order is: $order';
// }
//
// dynamic fetchUserOrder () =>
//     Future.delayed (
//       Duration (seconds: 3),
//         ()=> 'Large Latte',
//     ),


