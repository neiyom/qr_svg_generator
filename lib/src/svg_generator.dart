import 'package:flutter/material.dart';

import 'package:qr/qr.dart';

import 'qr_color.dart';
import 'qr_rect.dart';
import 'qr_row.dart';
import 'qr_svg_image.dart';

///generates a SVG vector graphic from a [qrCode]
///
///optionally set [colorA] and [colorB] for a gradient color
///otherwise the QR pixels default to black
QrSvgImage generateQrSvgImage(
    {required QrCode qrCode,
    required int imageSizeInPx,
    required String title,
    Color colorA = Colors.black,
    Color colorB = Colors.black,
    Color backgroundColor = Colors.white}) {
  final int qrPixelsAmountX = qrCode.moduleCount;
  final int qrPixelsAmountY = qrCode.moduleCount;

  final qrBackGroundColor = QrColor(color: backgroundColor, colorId: "cls-bg");
  final qrImage = QrImage(qrCode);

  QrImage(qrCode);
  final qrSvgImage = QrSvgImage(
      title: title,
      qrRows: [],
      size: imageSizeInPx,
      backgroundColor: backgroundColor);

  for (int j = 0; j < qrPixelsAmountY; j++) {
    //for each row

    //linear interpolation
    final double ratio = j /
        qrPixelsAmountY; // height = steps -> just take percentage p of the first color and
    // percentage 1 - p of the second: R = firstCol.R * p +
    // secondCol.R * (1 - p)
    final int red = (colorA.red + (colorB.red - colorA.red) * ratio).toInt();
    final int green =
        (colorA.green + (colorB.green - colorA.green) * ratio).toInt();
    final int blue =
        (colorA.blue + (colorB.blue - colorA.blue) * ratio).toInt();
    final int alpha =
        (colorA.alpha + (colorB.alpha - colorA.alpha) * ratio).toInt();

    //within the same row always the same color
    final color = Color.fromARGB(alpha, red, green, blue);
    final qrColor = QrColor(color: color, colorId: "cls-$j");

    final sizeMultiplier =
        double.parse((imageSizeInPx / qrPixelsAmountX).toStringAsFixed(2));

    //create a QrRow
    final qrRow = QrRow(id: "row$j", rectList: []);

    for (int i = 0; i < qrPixelsAmountX; i++) {
      //for each column
      //create a rect in the row
      final qrRect = QrRect(
          qrColor: qrColor,
          posY: j * sizeMultiplier,
          posX: i * sizeMultiplier,
          width: sizeMultiplier,
          height: sizeMultiplier);

      if (qrImage.isDark(i, j)) {
        //add colored rect
        qrRow.rectList.add(qrRect);
      } else {
        //drawing background
        //change color to background color before adding rect
        qrRect.qrColor = qrBackGroundColor;
        qrRow.rectList.add(qrRect);
      }
    }
    qrSvgImage.qrRows.add(qrRow);
  }
  return qrSvgImage;
}
