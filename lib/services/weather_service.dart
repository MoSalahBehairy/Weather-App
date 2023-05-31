// هنا ضفنا as علشان ادى اسم لكل حاجه جايه من الفايل ده او اقدر اكسيس كل اللى جوا
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '3677bed892474b30b7a122242220806';

  Future <WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData ;
    try {
      //هنا ال parse بتحول ال request او ال call اللى جايه ل url اقدر استخدمه فى ال get function
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

      // هنا استخدمت ال http مع ال Response علشان اقدر اكسيس كل اللى جوا ال Response
      // وضفنا اصلا ال http.Response علشان استقبل فيها البيانات اللى راجعه
      http.Response response = await http.get(url);
      // jsonDecode
      // ده بيحولى ال String اللى جاى اللى مش مفهوم ل jsonعلشان اقدر افهمه واتعامل معاه
      // هنا انابعمل نفس ال Response اللى جايلى من ال Api
      // ضفت Map  لان الداتا جايه على شكل Map وضفت String ده بتاع ال Key وضفت dynamic ده بتاع ال value
      // لان مش عارف بالظبط نوع الvalue اللى جاى ممكن يكون String or int or double
      Map<String, dynamic> data = jsonDecode(response.body);

      weatherData  = WeatherModel.fromJson(data);
    } catch (ex) {
      print (ex);
    }
    return weatherData;
  }
}


