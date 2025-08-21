import 'qr_rect.dart';

class QrRow {
  QrRow({required this.id, required this.rectList});
  String id;
  List<QrRect> rectList;

  @override
  String toString() {
    final rectsStr = rectList.map((rect) => rect.toString()).join('\n');
    return '  <g id="$id">\n$rectsStr\n  </g>';
  }
}
