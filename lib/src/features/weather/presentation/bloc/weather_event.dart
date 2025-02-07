part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props =>[];
}

class GetWeatherEvent extends WeatherEvent{
  final String city;

  GetWeatherEvent({required this.city});
  @override
  List<Object> get props =>[city];

}
