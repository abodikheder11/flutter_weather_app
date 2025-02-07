import 'package:dartz/dartz.dart';
import 'package:weather/src/core/error/exceptions.dart';
import 'package:weather/src/core/error/failures.dart';
import 'package:weather/src/features/weather/data/datasources/weatherDS.dart';
import 'package:weather/src/features/weather/domain/models/weather_model.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource remoteDS;

  WeatherRepositoryImpl(this.remoteDS);
  @override
  Future<Either<Failure, WeatherModel>> getWeather(String city) async {
    try {
      final weather = await remoteDS.getWeather(city);
      return Right(weather);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }
}
