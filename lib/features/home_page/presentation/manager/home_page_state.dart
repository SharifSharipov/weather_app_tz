part of 'home_page_bloc.dart';

enum HomePageStatus { initial, loading, success, error }

@immutable
class HomePageState extends Equatable {
  final HomePageStatus status;
  final String message;
  final List<WeatherInfo> weatherInfo;
  final List<String> searchHistory;
  const HomePageState({
    this.status = HomePageStatus.initial,
    this.message = "",
    required this.weatherInfo,
    this.searchHistory = const [],
  });

  HomePageState copyWith({
    HomePageStatus? status,
    String? message,
    List<WeatherInfo>? weatherInfo,
    final List<String>? searchHistory,
  }) {
    return HomePageState(
      status: status ?? this.status,
      message: message ?? this.message,
      weatherInfo: weatherInfo ?? this.weatherInfo,
      searchHistory: searchHistory ?? this.searchHistory,
    );
  }
  @override
  List<Object?> get props => [
        status,
        message,
        weatherInfo,
        searchHistory
  ];
}
