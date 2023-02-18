import 'package:get/get.dart';

class WidgetSize {
  // It's the AdobeXD Device Height
  final double targetHeightSize = 926;
  // It's the AdobeXD Device Width
  final double targetWidthSize = 428;

  double getHeight(double targetWidgetHeight) =>
      (Get.height * targetWidgetHeight) / targetHeightSize;

  double getWidth(double targetWidgetWidth) =>
      (Get.width * targetWidgetWidth) / targetWidthSize;
}

final widgetSize = WidgetSize();
