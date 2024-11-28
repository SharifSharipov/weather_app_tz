import 'package:weather_app/core/either/either.dart';

import 'package:weather_app/core/error/failure.dart';

import 'package:weather_app/features/detail_page/data/models/weather_info.dart';
import 'package:weather_app/router/app_routes.dart';

import '../../domen/repositories/add_weather_info_repositories.dart';

class AddWeatherInfoRepositoriesImpl implements AddWeatherInfoRepositories {
  @override
  Future<Either<Failure, WeatherInfo>> addWeatherInfo(
      { required WeatherInfo weatherInfo}) async {

    await localSource.addWeatherInfo(weatherInfo);
    return Future.value(Right(weatherInfo));
  }
}
