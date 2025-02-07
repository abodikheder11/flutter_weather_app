import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather/src/core/error/failures.dart';
import 'package:weather/src/features/weather/domain/models/weather_model.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repo;

  WeatherBloc(this.repo) : super(WeatherInitial()) {
    on<GetWeatherEvent>(_getWeather);
  }
  Future<void> _getWeather(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    final result = await repo.getWeather(event.city);
    result.fold(
      (failure) => emit(
        WeatherError("Failed to fetch data"),
      ),
      (weather) => emit(
        WeatherLoaded(weather),
      ),
    );
  }
}
