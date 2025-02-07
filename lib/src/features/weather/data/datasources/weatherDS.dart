import 'dart:convert';

import 'package:weather/src/core/error/exceptions.dart';
import 'package:weather/src/features/weather/domain/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRemoteDatasource {
  final String apiKey =
      "c08d3a43ac3c491c53dae03b6698300e";

  Future<WeatherModel> getWeather(String city) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");
    final response = await http.get(url);
    print("done ya za33m : ${response.body}");
    if (response.statusCode == 200) {

      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerExceptions();
    }
  }
}
