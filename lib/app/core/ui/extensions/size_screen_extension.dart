import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenSizeExtension on num {
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setHeight(this);
  double get r => ScreenUtil().radius(this); //! Round
  double get sp => ScreenUtil().setSp(this); //! FontSizes
  double get sw => ScreenUtil().screenWidth * this; //! ScreenWidth
  double get sh => ScreenUtil().screenHeight * this; //! ScreenHeight
  double get statusBar => ScreenUtil().statusBarHeight * this;
} 

extension ScreenSize on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  double percentWidth(double percent) => width * percent;
  double percentHeight(double percent) => height * percent;
}
