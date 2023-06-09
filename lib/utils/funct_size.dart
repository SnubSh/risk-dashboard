import 'package:flutter/material.dart';
import 'dart:math' as math;



class Value {
  static double wp(double porcent, double width) {
    var result = width * porcent / 100;
    return result;
  }

  static double hp(double porcent, double height) {
    var result = height * porcent / 100;
    return result;
  }

  static double dp(double porcent, Size size) {
    double diagonal = 0.0;
    double width = size.width;
    double height = size.height;
    diagonal = math.sqrt(math.pow(width, 2) + math.pow(height, 2));
    var result = diagonal * porcent / 100;
    return result;
  }

  static bool orientation(Orientation orientation) {
    if (orientation.name == 'landscape') {
      return true;
    } else {
      return false;
    }
    
  }
}
