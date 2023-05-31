
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/providers/weather_provider.dart';

class HomePage extends StatefulWidget {

   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi()
  {
setState(() {

});

  }
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()
            {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
            {
              return  SearchPage(
                updateUi: updateUi,
              );
            }));
          },
              icon: const Icon(Icons.search, color: Colors.white,))
        ],
        title: Row(
          children: [
            Container(height:40, width:40,child: Image.asset('assets/images/cloudy.png'),),
            SizedBox(width: 5,),
            const Text('Weather App', style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body:  weatherData == null? Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,

          children:  [
            Container(height:300, width: 300,child: Image.asset('assets/images/3d6.png'),),

            Text('Discover The Weather',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),),
            Text('in your city ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
            Spacer(),
            Text('Get to know your weather and', style: (
                TextStyle(
              color: Colors.grey,
              fontSize: 14,
            )),),
            Text('precipitation forcast ', style:TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),),
            Spacer(flex: 10,),
          ],
        ),
      ) : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[300]!,
              weatherData!.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  Spacer(flex: 2,),
            Text(Provider.of<WeatherProvider>(context).cityName!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), ),
            Text( 'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
              style: TextStyle(fontSize: 20),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Container(
                height: 100,
                child: Card(
                  shadowColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(width:70, height:70, child: Image.asset(weatherData!.getImage())),
                        Text(' ${weatherData!.temp.toInt().toString()}',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                               Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
                               Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                             ],
                        ),
                      ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(weatherData?.weatherStateName?? '',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), ),
           const Spacer(flex: 5,),
          ],
        ),
      ),

    );
  }
}
