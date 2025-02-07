import 'package:dartz/dartz.dart';
import 'package:weather/src/core/error/failures.dart';
import 'package:weather/src/features/weather/domain/models/weather_model.dart';

abstract class WeatherRepository{
  Future<Either<Failure, WeatherModel>> getWeather(String city);
}