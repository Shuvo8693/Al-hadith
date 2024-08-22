import 'dart:ui';

extension HexColorExtention on String {
  get  hexColor => _fromHex(this);
  static Color _fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
