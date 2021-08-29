import 'package:flutter/material.dart';
import 'design_sizes.dart';

class LayoutSizes {
  final BuildContext _context;
  static LayoutSizes? _instance;

  factory LayoutSizes(BuildContext context) {
    _instance ??= LayoutSizes._(context);
    return _instance!;
  }

  LayoutSizes._(this._context);

  Size get screenSize => MediaQuery.of(_context).size;

  double get maxWidth => screenSize.width;

  double get maxHeight => screenSize.height;

  double get progressBarHeightS => responsive(3);

  double get progressBarHeightM => responsive(6);

  double get progressBarHeightL => responsive(9);

  // Spacing
  /// Space Zero = 0.0
  double get spaceZero => 0.0;

  /// Space S = 4.0
  double get spaceS => responsive(4.0);

  /// Space M = 8.0
  double get spaceM => responsive(8.0);

  /// Space L => 16.0
  double get spaceL => responsive(16.0);

  // Margin
  /// Margin Zero => 0.0
  double get marginZero => 0.0;

  /// Margin S => 4.0
  double get marginS => responsive(4.0);

  /// Margin M => 8.0
  double get marginM => responsive(8.0);

  /// Margin L => 16.0
  double get marginL => responsive(16.0);

  double get marginXL => responsive(24.0);

  double get marginXXL => responsive(32.0);

  // Padding
  /// Padding Zero => 0.0
  double get paddingZero => 0.0;

  /// Padding S => 4.0
  double get paddingS => responsive(4.0);

  /// Padding M => 8.0
  double get paddingM => responsive(8.0);

  /// Padding L => 16.0
  double get paddingL => responsive(16.0);

  double get paddingXL => responsive(20.0);

  //radius

  double get radiusS => responsive(4);

  double get radiusM => responsive(8);

  double get radiusL => responsive(12);

  double get radiusXL => responsive(16);

  double get radiusXXL => responsive(20);

  double get radiusCircular => double.infinity;

  //icon size
  double get iconS => responsive(18);

  double get iconM => responsive(24);

  double get iconL => responsive(28);

  //button height
  double get buttonHeightS => responsiveH(28);

  double get buttonHeightM => responsiveH(32);

  double get buttonHeightL => responsiveH(36);

  //bottom app bar
  double get bottomAppBarHeight => responsive(40);

  //daynamic
  double responsive(double size, {Axis axis = Axis.vertical}) {
    final currentSize =
        axis == Axis.horizontal ? screenSize.width : screenSize.height;
    final designSize = axis == Axis.horizontal
        ? DesignSizes.mobileScreenSize.width
        : DesignSizes.mobileScreenSize.height;

    return size * currentSize / designSize;
  }

  double responsiveFontSize(double size) {
    return MediaQuery.of(_context).textScaleFactor * size;
  }

  double responsiveW(double size) {
    final currentSize = screenSize.width;
    final designSize = DesignSizes.mobileScreenSize.width;

    return size * currentSize / designSize;
  }

  double responsiveH(double size) {
    final currentSize = screenSize.height;
    final designSize = DesignSizes.mobileScreenSize.height;

    return size * currentSize / designSize;
  }
}
