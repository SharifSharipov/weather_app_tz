import 'package:weather_app/core/either/either.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/weather_info.dart';

abstract class AddWeatherInfoRepositories {
  Future<Either<Failure, WeatherInfo>> addWeatherInfo({
     required WeatherInfo weatherInfo
  });
}

