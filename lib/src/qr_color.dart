import 'package:flutter/material.dart';

class QrColor {
  QrColor({required this.color, required this.colorId});
  String colorId;
  Color color;

  @override
  String toString() {
    var hex = '#' + color.value.toRadixString(16).substring(2);
    return 'fill: $hex;';
  }
}
