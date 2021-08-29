import 'package:flutter/material.dart';
import 'package:todo/configs/app_colors.dart';
import 'package:todo/configs/durations.dart';
import 'package:todo/configs/sizes/index.dart';

class LinearProgress extends StatelessWidget {
  const LinearProgress({
    this.color = AppColors.progressBackgroundColor,
    this.valueColor = AppColors.progressValueColor,
    this.enableAnimation = true,
    this.progress,
  });

  final Color valueColor, color;
  final double? progress;
  final bool enableAnimation;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: ShapeDecoration(shape: const StadiumBorder(), color: color),
    );

    return Container(
        clipBehavior: Clip.hardEdge,
        height: LayoutSizes(context).progressBarHeightS,
        alignment: Alignment.centerLeft,
        decoration: ShapeDecoration(shape: const StadiumBorder(), color: color),
        child: enableAnimation
            ? AnimatedAlign(
                alignment: const Alignment(1, 0),
                duration: Durations.animationDuration,
                widthFactor: progress,
                child: child,
              )
            : FractionallySizedBox(
                widthFactor: progress,
                child: child,
              ));
  }
}
