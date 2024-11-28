import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/home_page/presentation/pages/home_page.dart';

import '../../../../core/icon/app_icons.dart';

mixin HomePageMixin on State<HomePage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  TextEditingController controller = TextEditingController();
  Map<String, String> weatherIconMap = {
    'Quyoshli': AppIcons.suny,
    'Bulutli': AppIcons.cloud,
    'yomg\'irli': AppIcons.runy,
    'Qorli': AppIcons.snow,
    'Quyoshli bulutli': AppIcons.sanAndCloud,
  };

}