import 'qr_color.dart';

class QrRect {
  QrRect(
      {required this.qrColor,
      required this.posY,
      required this.posX,
      required this.width,
      required this.height});
  QrColor qrColor;
  double posY, posX;
  double width, height;

  @override
  String toString() {
    return '    <rect style="${qrColor}" x="$posX" y="$posY" width="$width" height="$height"/>';
  }
}
