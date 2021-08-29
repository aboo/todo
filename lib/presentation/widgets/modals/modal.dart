import 'package:flutter/material.dart';
import 'package:todo/configs/app_colors.dart';
import 'package:todo/configs/sizes/index.dart';
import 'package:todo/routes.dart';

class Modal extends StatelessWidget {
  const Modal(
      {this.title, required this.child, this.padding = EdgeInsets.zero});

  final String? title;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: LayoutSizes(context).marginL,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(LayoutSizes(context).radiusL),
            topLeft: Radius.circular(LayoutSizes(context).radiusL)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(
            title: title,
          ),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String? title;

  const _Header({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DragLine(),
            _Title(title),
            Divider(
              height: 0.3,
              indent: LayoutSizes(context).marginM,
              endIndent: LayoutSizes(context).marginM,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            AppNavigator.pop();
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: LayoutSizes(context).marginL),
            child: Icon(
              Icons.close,
              size: LayoutSizes(context).iconS,
            ),
          ),
        ),
      ],
    );
  }
}

class _DragLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: LayoutSizes(context).responsive(40),
      height: LayoutSizes(context).responsive(2),
      margin: EdgeInsets.only(bottom: LayoutSizes(context).marginL),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.dragLineColor,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.text);

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const SizedBox();
    }
    return Padding(
      padding: EdgeInsets.only(bottom: LayoutSizes(context).paddingM),
      child: Text(
        text!,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
