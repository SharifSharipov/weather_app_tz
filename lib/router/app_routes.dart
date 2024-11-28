import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/detail_page/presentation/manager/add_weather_bloc.dart';
import 'package:weather_app/features/detail_page/presentation/pages/detail_page.dart';
import 'package:weather_app/features/home_page/presentation/pages/home_page.dart';

import '../core/local_source/local_source.dart';
import '../features/home_page/presentation/manager/home_page_bloc.dart';
import '../injector_container.dart';

part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final LocalSource localSource = sl<LocalSource>();
final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      builder: (_, __) => BlocProvider(create: (__) => sl<HomePageBloc>()..add( GetWeatherEvent()),
      child: const HomePage()),
    ),
    GoRoute(
      path: Routes.detail,
      name: Routes.detail,
      builder: (_, __) => BlocProvider(
          create: (__) => sl<AddWeatherBloc>(), child: const DetailPage()),
    ),
  ],
);
