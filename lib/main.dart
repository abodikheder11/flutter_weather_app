import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/features/weather/data/datasources/weatherDS.dart';
import 'package:weather/src/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather/src/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/src/features/weather/presentation/pages/weather_page.dart';

void main() {
  final WeatherRemoteDatasource remoteDataSource =WeatherRemoteDatasource();
  final WeatherRepository repo = WeatherRepositoryImpl(remoteDataSource);

  runApp(MyApp(repo,));
}

class MyApp extends StatelessWidget {

  final WeatherRepository repo;
  const MyApp( this.repo , {super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> WeatherBloc(repo),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    ),
    );
  }
}

