import 'dart:html';

import 'base/edge.dart';
import 'base/enum.dart';
import 'base/r.decoration.dart';
import 'rcolor.dart';

abstract class Style {
  int width;
  int height;
  bool expandHeight;
  bool expandWidth;
  EdgInset margin;
  EdgInset padding;
  bool ratioWidth;
  bool ratioHeight;
  Style(
      {this.height = 1,
      this.width = 1,
      this.margin = REdgetInset.zero,
      this.padding = REdgetInset.zero,
      this.ratioHeight = false,
      this.ratioWidth = false,
      this.expandHeight = false,
      this.expandWidth = false});
  Element createStyle(Element e);
}

class RStyle extends Style {
  bool modeRatio;

  Decoration? decoration;
  AligmentHorizontal alignHorizontal;
  AlignmentVertical alignmentVertical;
  RStyle(
      {this.modeRatio = true,
      super.margin = REdgetInset.zero,
      super.padding = REdgetInset.zero,
      this.alignHorizontal = AligmentHorizontal.none,
      this.alignmentVertical = AlignmentVertical.none,
      super.height = 0,
      super.width = 0,
      super.ratioHeight = false,
      super.ratioWidth = false,
      this.decoration,
      super.expandHeight = false,
      super.expandWidth = false});

  @override
  Element createStyle(element) {
    if (margin != REdgetInset.zero) {
      element
        ..style.marginTop = "${margin.top}px"
        ..style.marginBottom = "${margin.bottom}px"
        ..style.marginLeft = "${margin.left}px"
        ..style.marginRight = "${margin.right}px";
    }

    element
      ..style.width = width != 0
          ? ratioWidth
              ? "$width%"
              : "${width}px"
          : ""
      ..style.height = height != 0
          ? ratioHeight
              ? "$height%"
              : "${height}px"
          : ""
      ..style.justifyContent = alignHorizontal.value
      ..style.alignItems = alignmentVertical.value
      ..style.padding =
          "${padding.top}px ${padding.right}px ${padding.bottom}px ${padding.left}px";

    if (expandHeight) element.style.height = "inherit";
    if (expandHeight) element.style.width = "inherit";
    if (decoration != null) {
      element
        ..style.backgroundColor = decoration!.color
        ..style.border = decoration!.border.toString()
        ..style.borderRadius = decoration!.border.raduis.toString()
        ..style.boxShadow = decoration!.shadow?.toString() ?? "";

      //BoxShadow

    }
    return element;
  }
}
// Shadow Box

class BoxShadow {
  /// Couleur de l'ombre
  final String color;

  ///Decalage Horizontal de l'ombre
  final int horizontal;

  ///Decalage verticale
  final int vertical;

  /// La dispersion de lombre
  final int blur;

  BoxShadow(
      {this.color = Colors.gray,
      this.horizontal = 1,
      this.vertical = 1,
      this.blur = 1});
  @override
  String toString() {
    return "$color ${horizontal}px ${vertical}px ${blur}px";
  }
}
