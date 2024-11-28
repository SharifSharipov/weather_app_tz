import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../../contstants/constants.dart';
import '../../features/detail_page/data/models/weather_info.dart';

class LocalSource {
  LocalSource(this.box);

  final Box<WeatherInfo> box;
  final Box<String> searchHistoryBox = Hive.box(AppKeys.searchHistory);

  Future<void> addWeatherInfo(WeatherInfo weatherInfo) async {
    try {
      await box.add(weatherInfo);
    } catch (e, st) {
      debugPrint("Error adding weather info: $e  $st");
    }
  }

  List<WeatherInfo> getAllWeatherInfo() {
    return box.values.toList();
  }

  WeatherInfo? getWeatherInfo(int index) {
    return box.getAt(index);
  }

  Future<void> updateWeatherInfo(int index, WeatherInfo weatherInfo) async {
    try {
      await box.putAt(index, weatherInfo);
    } catch (e, st) {
      debugPrint("Error updating weather info: $e  $st");
    }
  }

  Future<void> deleteWeatherInfo(int index) async {
    try {
      await box.deleteAt(index);
    } catch (e, st) {
      debugPrint("Error deleting weather info: $e  $st");
    }
  }

  Future<void> clearAllWeatherInfo() async {
    try {
      await box.clear();
    } catch (e, st) {
      debugPrint("Error clearing all weather info: $e  $st");
    }
  }

  List<WeatherInfo> searchWeatherInfo(String query) {
    if (query.isNotEmpty && !searchHistoryBox.values.contains(query)) {
      if (searchHistoryBox.length >= 3) {
        searchHistoryBox.deleteAt(0);
      }
      searchHistoryBox.add(query);
    }

    return box.values.where((weather) {
      return weather.cityName.toLowerCase().contains(query.toLowerCase()) ||
          weather.weatherCondition.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<String> getSearchHistory() {
    return searchHistoryBox.values.toList().reversed.toList();
  }

  Future<Box<WeatherInfo>> _getWeatherInfoBox() async {
    var box = await Hive.openBox<WeatherInfo>(AppKeys.weatherInfo);
    return box;
  }
}
