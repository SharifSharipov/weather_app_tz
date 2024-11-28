import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/detail_page/presentation/pages/detail_page.dart';

mixin DetailPageMixin on State<DetailPage> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  TextEditingController controllerTown = TextEditingController();
  TextEditingController controllerTemp = TextEditingController();
  TextEditingController controllerCondition = TextEditingController();
  TextEditingController controllerData = TextEditingController();

}