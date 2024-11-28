import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/color/app_color.dart';
import 'package:weather_app/core/extentions/size_extenions.dart';
import 'package:weather_app/core/uitils/app_utils.dart';
import 'package:weather_app/features/detail_page/data/models/weather_info.dart';
import 'package:weather_app/features/detail_page/presentation/manager/add_weather_bloc.dart';
import 'package:weather_app/features/detail_page/presentation/widgets/town_data_text_fields.dart';
import '../../../../core/helper/helper.dart';
import '../../../../router/app_routes.dart';
import 'detail_page_mixin.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with DetailPageMixin {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AddWeatherBloc, AddWeatherState>(
          builder: (BuildContext context, AddWeatherState state) => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    title: const Text("Add Town data"),
                    centerTitle: true,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        context.pushNamed(Routes.home);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  body: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TownDataTextFields(
                              controller: controllerTown,
                              onTap: () {},
                              labelText: 'Shahar',
                              hintText: 'Shahar nomini kiriting',
                            ),
                            TownDataTextFields(
                              controller: controllerTemp,
                              onTap: () {},
                              labelText: 'Harorat',
                              hintText: 'Haroratni kiriting',
                            ),
                            TownDataTextFields(
                              controller: controllerCondition,
                              onTap: () {},
                              labelText: 'Ob havo holati',
                              hintText: 'Ob havo holatini kiriting',
                            ),
                            TownDataTextFields(
                              controller: controllerData,
                              onTap: () {},
                              labelText: 'Sana',
                              hintText: 'Sanani kiriting',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.88,
                              child: GestureDetector(
                                onTap: () {
                                  if (controllerTown.text.isNotEmpty &&
                                      controllerTemp.text.isNotEmpty &&
                                      controllerCondition.text.isNotEmpty &&
                                      controllerData.text.isNotEmpty) {
                                    context.read<AddWeatherBloc>().add(
                                        AddWeatherEventSave(
                                            weatherInfo: WeatherInfo(
                                                cityName: controllerTown.text,
                                                temperature: double.parse(
                                                    controllerTemp.text),
                                                weatherCondition:
                                                    controllerCondition.text,
                                                date: controllerData.text)));
                                    controllerTown.clear();
                                    controllerTemp.clear();
                                    controllerCondition.clear();
                                    controllerData.clear();
                                    Helpers.showToast(
                                        "Data added successfully!");
                                    context.pushNamed(Routes.home);
                                  }
                                },
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: AppUtils.kBorderRadius12,
                                    color: AppColors.c_E6BB3D,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                          color: AppColors.c_212121,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            (height * 0.05).ph,
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
}
