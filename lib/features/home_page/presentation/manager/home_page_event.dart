part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}
class InitEvent extends HomePageEvent {}
class GetWeatherEvent extends HomePageEvent {}
class SearchWeatherEvent extends HomePageEvent {
  final String query;
  SearchWeatherEvent(this.query);
}
class DeleteWeatherEvent extends HomePageEvent {
  final int index;
  DeleteWeatherEvent(this.index);
}
