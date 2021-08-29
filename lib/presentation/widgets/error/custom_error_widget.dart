import 'package:flutter/material.dart';
import 'package:todo/configs/sizes/index.dart';
import 'package:todo/configs/strings.dart';
import 'package:todo/presentation/widgets/spacer/spacer.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? tryAgain;

  const CustomErrorWidget({Key? key, required this.message, this.tryAgain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
          VSpacer(LayoutSizes(context).marginL),
          if (tryAgain != null)
            ElevatedButton.icon(
              onPressed: tryAgain!,
              icon: Icon(Icons.wifi_protected_setup_outlined),
              label: Text(
                Strings.tryAgain,
                style: Theme.of(context).textTheme.button,
              ),
            )
        ],
      ),
    );
  }
}
