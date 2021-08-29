import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo/configs/app_colors.dart';
import 'package:todo/configs/sizes/index.dart';

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: AppColors.shimmerColor,
          highlightColor: Colors.grey.withOpacity(0.3),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: LayoutSizes(context).responsive(75),
                  height: LayoutSizes(context).responsive(75),
                  color: const Color(0xffeeeeee),
                ),
                SizedBox(
                  width: LayoutSizes(context).responsive(12),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 12.0),
                        height: LayoutSizes(context).responsiveH(18.0),
                        color: const Color(0xffeeeeee),
                      ),
                      SizedBox(
                        height: LayoutSizes(context).responsive(10),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 24.0),
                        height: LayoutSizes(context).responsiveH(14),
                        color: const Color(0xffeeeeee),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount: 3,
      ),
    );
  }
}
