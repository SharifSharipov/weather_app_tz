import 'package:flutter/material.dart';
import '../color/app_color.dart';
import '../uitils/app_utils.dart';


class GlobalTextFieldsWidget extends StatefulWidget {
  const GlobalTextFieldsWidget(
      {super.key,
        required this.controller,
        required this.onTapSearch,
        required this.onChanged});
  final TextEditingController controller;
  final VoidCallback onTapSearch;
  final ValueChanged onChanged;

  @override
  State<GlobalTextFieldsWidget> createState() => _GlobalTextFieldsWidgetState();
}

class _GlobalTextFieldsWidgetState extends State<GlobalTextFieldsWidget> {
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height * 0.05,
    width: width * 0.88,
    child: DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
          border: Border.all(
              color: widget.controller.text.isEmpty
                  ? AppColors.c_f4f4f6
                  : AppColors.c_DD1470),
          color: widget.controller.text.isEmpty
              ? AppColors.c_f4f4f6
              : AppColors.c_FDEDF4),
      child: Center(
        child: Padding(
          padding: AppUtils.kPaddingHor10,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              widget.onChanged(value);
              value = widget.controller.text;
              setState(() {});
            },
            style:const TextStyle(color: AppColors.c_212121,fontSize: 16),
            decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle:const TextStyle(color: AppColors.c_212121,fontSize: 16),
                suffixIcon: IconButton(
                    onPressed: widget.onTapSearch,
                    icon:const Icon(Icons.search)),
           ),
          ),
        ),
      ),
    ),
  );
}
