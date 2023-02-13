import '../rcolor.dart';
import 'enum.dart';

class Rborder {
  final BorderSide side;
  final BorderStyle style;
  final Raduis raduis;
  static const none = Rborder();
  const Rborder({
    this.raduis = Raduis.zero,
    this.side = BorderSide.none,
    this.style = BorderStyle.none,
  });

  @override
  String toString() {
    return "${side.toString()} ${style.name}";
  }
}

// bodersid
class BorderSide {
  //Saide
  final double side;
  final String color;
  static const none = BorderSide();
  const BorderSide({this.color = Colors.Black, this.side = 1});
  @override
  String toString() {
    return "$color ${side}px";
  }
}

class Raduis {
  final int topLeft;
  final int topRight;
  final int bottomLeft;
  final int bottomRight;
  static const Raduis zero = Raduis();
  const Raduis(
      {this.topRight = 0,
      this.topLeft = 0,
      this.bottomRight = 0,
      this.bottomLeft = 0});

  static Raduis all(int value) => Raduis(
      topRight: value, topLeft: value, bottomRight: value, bottomLeft: value);
  @override
  String toString() {
    // conversion en Text Css
    return "${topRight}px ${topLeft}px ${bottomRight}px ${bottomLeft}px";
  }
}
