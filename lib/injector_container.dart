import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/contstants/constants.dart';
import 'package:weather_app/features/detail_page/data/models/weather_info.dart';
import 'package:weather_app/features/detail_page/domen/repositories/add_weather_info_repositories.dart';
import 'package:weather_app/features/detail_page/presentation/manager/add_weather_bloc.dart';
import 'package:weather_app/features/home_page/presentation/manager/home_page_bloc.dart';
import 'core/local_source/local_source.dart';
import 'features/detail_page/data/repositories/add_weather_info_repositories_impl.dart';

final GetIt sl = GetIt.instance;
late Box<WeatherInfo> _box;

Future<void> init() async {
  await _initHive();
  sl.registerSingleton<LocalSource>(LocalSource(_box));
  getWeatherInfo();
}

void getWeatherInfo() {
  sl
    ..registerLazySingleton<AddWeatherInfoRepositories>(
        () => AddWeatherInfoRepositoriesImpl())
    ..registerFactory(() => AddWeatherBloc(
        addWeatherInfoRepositories: sl<AddWeatherInfoRepositories>()))..registerFactory(()=>HomePageBloc());
}

Future<void> _initHive() async {
  Hive.registerAdapter(WeatherInfoAdapter());

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  debugPrint("Opening Hive boxes...");
  _box = await Hive.openBox<WeatherInfo>(AppKeys.weatherInfo);
  await Hive.openBox<String>(AppKeys.searchHistory);
  debugPrint("Hive boxes opened successfully.");
}
