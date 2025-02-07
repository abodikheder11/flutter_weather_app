class WeatherModel {
  final String city;
  final double temperature; // ✅ Change to double
  final String condition;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(), // ✅ Ensure it's double
      condition: json['weather'][0]['description'],
    );
  }
}
