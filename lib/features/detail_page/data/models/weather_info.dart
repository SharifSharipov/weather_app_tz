import 'package:hive/hive.dart';

part 'weather_info.g.dart';

@HiveType(typeId: 0)
class WeatherInfo extends HiveObject {
  @HiveField(0)
  final String cityName;

  @HiveField(1)
  final double temperature;

  @HiveField(2)
  final String weatherCondition;

  @HiveField(3)
  final String date;

  WeatherInfo({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.date,
  });
}
