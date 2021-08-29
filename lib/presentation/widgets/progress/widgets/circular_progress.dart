import 'package:flutter/material.dart';
import 'package:todo/configs/app_colors.dart';
import 'package:todo/configs/sizes/index.dart';

class CircularProgress extends StatelessWidget {
  final Color valueColor;
  final Color color;
  final double? progressValue;

  const CircularProgress(
      {Key? key,
      this.color = AppColors.progressBackgroundColor,
      this.valueColor = AppColors.progressValueColor,
      this.progressValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: LayoutSizes(context).responsive(40),
        height: LayoutSizes(context).responsive(40),
        padding: EdgeInsets.all(LayoutSizes(context).paddingS),
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          borderRadius: BorderRadius.all(
              Radius.circular(LayoutSizes(context).radiusCircular)),
          color: color,
        ),
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          value: progressValue,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        ),
      ),
    );
  }
}
