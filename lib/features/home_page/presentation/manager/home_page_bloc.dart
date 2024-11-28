
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/router/app_routes.dart';

import '../../../detail_page/data/models/weather_info.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState(weatherInfo: [])) {
    on<GetWeatherEvent>(_getWeatherInfo);
    on<SearchWeatherEvent>(_searchWeatherInfo);
    on<DeleteWeatherEvent>(_deleteWeatherInfo);
  }

  Future<void> _getWeatherInfo(
      GetWeatherEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(
      message: "Loading",
      status: HomePageStatus.loading,
    ));

    try {
      final List<WeatherInfo> weatherInfoList =
          localSource.getAllWeatherInfo();
      print("weatherInfoList: ${weatherInfoList.length}");
      emit(state.copyWith(
        weatherInfo: weatherInfoList,
        status: HomePageStatus.success,
        message: "Weather data loaded successfully",
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomePageStatus.error,
        message: "Failed to load weather data",
      ));
    }
  }
  Future<void> _searchWeatherInfo(SearchWeatherEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(
      message: "Searching...",
      status: HomePageStatus.loading,
    ));

    try {
      final List<WeatherInfo> filteredWeatherList = localSource.searchWeatherInfo(event.query);
      final List<String> searchHistory = localSource.getSearchHistory();

      emit(state.copyWith(
        weatherInfo: filteredWeatherList,
        searchHistory: searchHistory,
        status: HomePageStatus.success,
        message: "Search completed successfully",
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomePageStatus.error,
        message: "Failed to search weather data",
      ));
    }
  }
  Future<void>_deleteWeatherInfo(DeleteWeatherEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(
      message: "Deleting...",
      status: HomePageStatus.loading,
    ));

    try {
      localSource.deleteWeatherInfo(event.index);
      final List<WeatherInfo> weatherInfoList = localSource.getAllWeatherInfo();
      emit(state.copyWith(
        weatherInfo: weatherInfoList,
        status: HomePageStatus.success,
        message: "Weather data deleted successfully",
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomePageStatus.error,
        message: "Failed to delete weather data",
      ));
    }
  }

}
