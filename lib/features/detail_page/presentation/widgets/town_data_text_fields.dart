import 'package:flutter/material.dart';
import 'package:weather_app/core/extentions/size_extenions.dart';

import '../../../../core/color/app_color.dart';
import '../../../../core/uitils/app_utils.dart';

class TownDataTextFields extends StatefulWidget {
  const TownDataTextFields(
      {super.key,
      required this.controller,
      required this.onTap,
      required this.labelText,
      required this.hintText});
  final TextEditingController controller;
  final VoidCallback onTap;
  final String labelText;
  final String hintText;
  @override
  State<TownDataTextFields> createState() => _TownDataTextFieldsState();
}

class _TownDataTextFieldsState extends State<TownDataTextFields> {
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.labelText,
              style: const TextStyle(color: AppColors.c_DD1470, fontSize: 16),
            ),
            (height / 100).ph,
            SizedBox(
              height: height * 0.05,
              width: width * 0.88,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  border: Border.all(
                    color: AppColors.c_DD1470,
                  ),
                  color: AppColors.c_FDEDF4,
                ),
                child: Center(
                  child: Padding(
                    padding: AppUtils.kPaddingHor10,
                    child: TextField(
                      controller: widget.controller,
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: AppColors.c_212121, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
                            color: AppColors.c_212121, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
  );
}
