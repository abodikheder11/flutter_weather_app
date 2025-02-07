import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/features/weather/presentation/bloc/weather_bloc.dart';

class WeatherPage extends StatelessWidget {
   WeatherPage({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter City Name",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value){
                context.read<WeatherBloc>().add(GetWeatherEvent(city: value));
              },
            ),
            const SizedBox(height: 20,),
            BlocBuilder<WeatherBloc,WeatherState>(
                builder:(context , state){
                  if(state is WeatherLoading){
                    return CircularProgressIndicator();
                  }else if(state is WeatherLoaded){
                    return Column(
                      children: [
                      Text(
                        "${state.weather.temperature}°C",
                        style: TextStyle(fontSize: 40),
                      ),
                        Text(state.weather.condition , style: TextStyle(fontSize: 24),)
                      ],
                    );
                  }else if(state is WeatherError){
                    return Text(state.error);
                  }
                  return SizedBox(height: 10,);
                }
            )
          ],
        ),
      ),
    );
  }
}
