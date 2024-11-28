part of 'add_weather_bloc.dart';

@immutable
sealed class AddWeatherEvent {}
class AddWeatherEventStarted extends AddWeatherEvent {}
class AddWeatherEventSave extends AddWeatherEvent {
  final WeatherInfo weatherInfo;

  AddWeatherEventSave({
 required this.weatherInfo
  });
}
class AddWeatherEventFinished extends AddWeatherEvent {}