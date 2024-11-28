part of 'add_weather_bloc.dart';

enum AddWeatherStatus { initial, loading, success, error }

@immutable
class AddWeatherState extends Equatable {
  const AddWeatherState({
    this.message = "",
    this.status = AddWeatherStatus.initial,
    required this.weatherInfo,
  });
  final String message;
  final AddWeatherStatus status;
  final WeatherInfo weatherInfo;
  AddWeatherState copyWith({
    String? message,
    AddWeatherStatus? status,
    WeatherInfo? weatherInfo,
  }) =>
      AddWeatherState(
        message: message ?? this.message,
        status: status ?? this.status,
        weatherInfo: weatherInfo ?? this.weatherInfo,
      );
  @override
  List<Object?> get props => [
        message,
        status,
        weatherInfo,
      ];
}
