import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/extentions/size_extenions.dart';
import 'package:weather_app/core/icon/app_icons.dart';
import 'package:weather_app/core/uitils/app_utils.dart';
import 'package:weather_app/features/home_page/presentation/manager/home_page_bloc.dart';
import 'package:weather_app/features/home_page/presentation/pages/home_page_mixin.dart';
import 'package:weather_app/features/home_page/presentation/widgets/weather_sings_widget.dart';
import 'package:weather_app/router/app_routes.dart';
import '../../../../core/color/app_color.dart';
import '../../../../core/widget/global_text_filed_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HomePageBloc, HomePageState>(
          builder: (BuildContext context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Weather"),
                centerTitle: true,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      context.pushNamed(Routes.detail);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size(double.infinity, height * 0.07),
                  child: GlobalTextFieldsWidget(
                    controller: controller,
                    onTapSearch: () {
                      FocusScope.of(context).unfocus();
                      context
                          .read<HomePageBloc>()
                          .add(SearchWeatherEvent(controller.text));
                    },

                    onChanged: (value) {
                      context.read<HomePageBloc>().add(SearchWeatherEvent(value));
                    },
                  ),
                ),
              ),
              body: Padding(
                padding: AppUtils.kPaddingHor16,
                child: state.weatherInfo.isEmpty
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (height / 100).ph,
                    const Text(
                      "Data yaratayotganizda Ob havo holatiga quyidagi tekslarni kiriting: Quyoshli, Bulutli, Yomg'irli, Qorli, Quyoshli bulutli.",
                      style:
                      TextStyle(fontSize: 20, color: AppColors.c_212121),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                )
                    : ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    String weatherCondition = state
                        .weatherInfo[index].weatherCondition
                        .toLowerCase();
                    String weatherIcon =
                        weatherIconMap[weatherCondition] ?? AppIcons.suny;
                    return WeatherSingsWidget(
                      height: height,
                      width: width,
                      icon: weatherIcon,
                      town: state.weatherInfo[index].cityName,
                      onTap: () {
                        context
                            .read<HomePageBloc>()
                            .add(DeleteWeatherEvent(index));
                      },
                      temperature:"${state.weatherInfo[index].temperature.toInt().toString()}°C",
                      data: state.weatherInfo[index].weatherCondition,
                    );
                  },
                  itemCount: state.weatherInfo.length,
                ),
              ),
            );
          });
}

