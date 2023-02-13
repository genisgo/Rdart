import '../rcolor.dart';
import '../rstyle.dart';
import 'border.dart';

class Decoration {
  String color;
  Rborder border;
  BoxShadow? shadow;
  Decoration(
      {this.border = Rborder.none, this.color = Colors.White, this.shadow});
}
