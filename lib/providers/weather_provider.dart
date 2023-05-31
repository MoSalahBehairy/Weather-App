import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;
  // هنعمل هنا setter & getter علشان نأكسس الداتا بتاعته
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    // بنستخدم ال notifiyListeners علشان اى هيستخدم الداتا اللى جايه من ال provider يستمع ليها
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
