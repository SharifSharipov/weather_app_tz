import 'package:flutter/material.dart';

import '../../../../core/color/app_color.dart';
import '../../../../core/uitils/app_utils.dart';

class WeatherSingsWidget extends StatelessWidget {
  const WeatherSingsWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.icon,
      required this.town, required this.onTap, required this.temperature, required this.data});
  final double height;
  final double width;
  final String icon;
  final String town;
  final String temperature;
  final String data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: height * 0.1,
                width: width * 0.2,
                child: Image.asset(icon)),
            AppUtils.kGap40,
            SizedBox(
              height: height * 0.1,
              width: width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                     "$town $temperature",
                      style: const TextStyle(
                          fontSize: 20, color: AppColors.c_212121),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      data,
                      style: const TextStyle(
                          fontSize: 20, color: AppColors.c_212121),
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: onTap, icon: const Icon(Icons.delete))
          ],
        ),
      );
}
