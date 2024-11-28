import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/detail_page/data/models/weather_info.dart';
import 'package:weather_app/features/detail_page/domen/repositories/add_weather_info_repositories.dart';

import '../../../../core/error/failure.dart';

part 'add_weather_event.dart';
part 'add_weather_state.dart';

class AddWeatherBloc extends Bloc<AddWeatherEvent, AddWeatherState> {
  final AddWeatherInfoRepositories addWeatherInfoRepositories;
  AddWeatherBloc({required this.addWeatherInfoRepositories})
      : super(AddWeatherState(
            weatherInfo: WeatherInfo(
                cityName: "",
                temperature: 0.0,
                weatherCondition: "",
                date: ""))) {
    on<AddWeatherEventSave>(_addWeather);
  }
  Future<void> _addWeather(
      AddWeatherEventSave event, Emitter<AddWeatherState> emit) async {
    emit(state.copyWith(status: AddWeatherStatus.loading, message: "Loading"));
    final result = await addWeatherInfoRepositories.addWeatherInfo(
        weatherInfo: event.weatherInfo);
    result.fold(
        (Failure failure) => emit(state.copyWith(
            message: failure.message, status: AddWeatherStatus.error)),
        (WeatherInfo weatherInfo) => emit(state.copyWith(
            weatherInfo: weatherInfo, status: AddWeatherStatus.success)));
  }
}
