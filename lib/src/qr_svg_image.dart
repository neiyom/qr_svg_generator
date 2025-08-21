import 'package:flutter/material.dart';

import 'qr_color.dart';
import 'qr_row.dart';

class QrSvgImage {
  QrSvgImage(
      {required this.title,
      required this.qrRows,
      required this.size,
      required this.backgroundColor});
  String title;
  List<QrRow> qrRows;
  int size;
  Color backgroundColor;

  ///returns the SVG file contents
  @override
  String toString() {
    //first set the first color to the background color
    //then for each qrRow find the color of this row
    //the color of the first non-background rect
    //if the whole row is background, then it's the background color
    final colors =
        QrColor(colorId: "cls-bg", color: backgroundColor).toString() +
            qrRows
                .map((e) => e.rectList
                    .firstWhere(
                      (rect) => rect.qrColor.color != backgroundColor,
                      orElse: () => e.rectList.first,
                    )
                    .qrColor
                    .toString())
                .join('\n');
    final rows = qrRows.map((e) => e.toString()).join('\n');
    final str =
        '<svg id="mainLayer" xmlns="http://www.w3.org/2000/svg" width="$size" height="$size" viewBox="0 0 $size $size" xmlns:xlink="http://www.w3.org/1999/xlink">\n'
        '  <defs>\n'
        '  </defs>\n'
        '  <title>$title</title>\n'
        '${rows.toString()}'
        '\n</svg>';
    return str;
  }
}
