import 'dart:html';
import 'base/enum.dart';
import 'r.element.dart';
import 'rcolor.dart';
import 'rstyle.dart';

/// La page d'application
class Page extends Relement {
  Relement? appBar;
  Relement? body;
  Relement? bottom;
  RStyle? bodyStyle;
  RStyle? appBarStyle;
  RStyle? bottomStyle;
  String backgroundColor;
  Page(
      {this.appBar,
      this.body,
      this.bottom,
      this.backgroundColor = Colors.white,
      this.appBarStyle,
      this.bodyStyle,
      this.bottomStyle});

  //Div element
  final _element = DivElement();
  @override
  Element create() {
    _element
      ..id = "page"
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.display = "flex"
      ..style.flexDirection = "column"
      ..style.backgroundColor = backgroundColor;
    if (appBar != null) {
      var appbarElement = appBar!.create();
      if (appBarStyle != null) {
        appbarElement = appBarStyle!.createStyle(appbarElement);
      }
      _element.children.add(appbarElement);
    }
    if (body != null) {
      var bodyElment = body!.create();
      if (bodyStyle != null) bodyElment = bodyStyle!.createStyle(bodyElment);
      _element.children.add(bodyElment);
    }
    if (bottom != null) {
      var bottomElement = bottom!.create();
      if (bottomStyle != null) {
        bottomElement = bottomStyle!.createStyle(bottomElement);
      }
      _element.children.add(bottom!.create());
    }
    return _element;
  }

  @override
  Element get getElement => _element;
}

///Les container
class Container extends Relement {
  ///Definit la hauteur, si [width] est definis la hauter est en pixel (px)
  ///Lors ce que vous souhaitez une responsive utiliser [style] et definissez les dimensions
  int width;

  ///Definit la hauteur, si [height] est definis la hauter est en pixel (px)
  ///Lors ce que vous souhaitez une responsive utiliser [style] et definissez les dimensions
  int height;

  ///utiliez pour mettre un enfant (un est autre Relement)
  Relement? child;

  ///Utiliser pour definir les styls et decoration. [style] Permet par exemple la bordure, la couleur
  /* Exemple RStyle(margin: REdgetInset.all(10) */
  RStyle? style;
  Container({
    this.child,
    this.style,
    this.width = 0,
    this.height = 0,
  });
  var _div = Element.div();
  @override
  Element create() {
    if (style != null) {
      if (height != 0) style!.height = height;
      if (width != 0) style!.width = width;
      _div = style!.createStyle(_div);
    } else {
      _div
        ..style.width = "${width}px"
        ..style.height = "${height}px";
    }
    _div
      ..className = "container"
      ..style.display = "flex";

    if (child != null) {
      _div.children.add(child!.create());
    }

    return _div;
  }

  @override
  Element get getElement => _div;
}

//AppBar : la barre d'application

class Appbar extends Relement {
  final Relement? title;
  final Relement? backup;
  final int heigth;
  final List<Relement> actions;
  final String text;
  final RelementCallBack? onPress;

  String backgroundColor;
  Appbar(
      {this.title,
      this.text = "",
      this.backup,
      this.actions = const [],
      this.backgroundColor = "Blue",
      this.heigth = 45,
      this.onPress});

  //balise
  var div = Element.nav();
  @override
  Element create() {
    div
      ..id = "appbar"
      ..style.height = "${heigth}px"
      ..style.width = "100%"
      ..style.padding = "4px 0px 0px 0px"
      ..style.display = "inline-flex"
      ..style.boxShadow = "1px 1px 10px grey"
      ..style.backgroundColor = backgroundColor;
    if (onPress != null) {
      div.onClick.listen((event) {
        onPress!(this);
      });
    }

    if (backup != null) {
      div.children.add(Element.div()
        ..id = "backup"
        ..style.display = "inline-flex"
        ..style.alignItems = "center"
        ..style.padding = "10px"
        ..children.add(backup!.create())
        ..style.width = "10%");
    }
    if (title != null) {
      div.children.add(Element.div()
        ..style.width = "40%"
        ..style.padding = "10px"
        ..children.add(title!.create())
        ..id = "titre");
    }

    if (text.isNotEmpty) {
      div.innerText = text;
    }

    if (actions.isNotEmpty) {
      final contentAction = Element.div()
        ..id = "titreAction"
        ..style.display = "flex"
        ..style.justifyContent = ""
        ..style.width = "50%";
      contentAction.children.addAll(actions.map((e) => e.create()));

      div.children.add(contentAction);
    }
    querySelector("body")!.children.add(div);

    return div;
  }

  @override
  Element get getElement => div;
}

//Text Element

class Text extends Relement {
  String text;
  String color;
  CssStyleDeclaration? style;
  int size;
  Text(this.text, {this.color = Colors.Black, this.size = 20, this.style});
  //Div element
  final divele = Element.div();
  @override
  Element create() {
    return divele
      ..innerText = text
      ..style.color = color
      ..style.fontSize = "${size}px";
  }

  @override
  // TODO: implement getElement
  Element get getElement => divele;
}

//Icon
class Ricon extends Relement {
  const Ricon(
      {this.unicode = "\u2003", this.color = Colors.White, this.size = 24})
      : super();
  final int size;
  final String unicode;
  final String color;
  @override
  Element create() {
    return Element.div()
      ..text = unicode
      ..className = "icon"
      ..style.color = color
      ..style.fontSize = "${size}px"
      ..id = unicode;
  }

  @override
  Element get getElement => querySelector("#$unicode")!;
}

enum Ricons {
  ///  [\u2665]
  Coeur("\u2665"),
  CoeurSymbole("\u2765");

  const Ricons(this.iconCode);
  final String iconCode;
  Ricon getIcon({int size = 24, String color = Colors.White}) =>
      Ricon(color: color, size: size, unicode: iconCode);
}

//Row Element

class Row extends Relement {
  List<Relement> children;
  AligmentHorizontal mainAxisAlignment;
  AlignmentVertical crossAxisAlignment;
  Row(
      {this.children = const [],
      this.crossAxisAlignment = AlignmentVertical.top,
      this.mainAxisAlignment = AligmentHorizontal.left});
  final _div = Element.div();
  @override
  Element create() {
    _div
      ..className = "row"
      ..style.display = "flex"
      ..style.float = "left";
    _div.children.addAll(children.map((e) => e.create()));
    return RStyle(
            alignHorizontal: mainAxisAlignment,
            alignmentVertical: crossAxisAlignment)
        .createStyle(_div);
  }

  @override
  // TODO: implement getElement
  Element get getElement => _div;
}

///Colum Element

class Column extends Relement {
  ///Les elements de la colone
  List<Relement> children;

  ///Le mainAxisAlignment est l'alignement qui definis la disposition des
  ///elements de fa??on horizontale par defaut les element sondisposer a gauche
  ///la valeur par defaut est une list vide *const []*
  AligmentHorizontal mainAxisAlignment;

  /// [crossAxisAlignment] est l'alignement verticale des elements par defaut
  /// sa valeur est [AlignmentVertical.top]
  AlignmentVertical crossAxisAlignment;
  Column(
      {this.children = const [],
      this.crossAxisAlignment = AlignmentVertical.top,
      this.mainAxisAlignment = AligmentHorizontal.left});
  final _div = Element.div();
  @override
  Element create() {
    _div
      ..className = "column"
      ..style.display = "flex"
      ..style.flexDirection = "column";

    _div.children.addAll(children.map((e) => e.create()));
    return RStyle(
            alignHorizontal: mainAxisAlignment,
            alignmentVertical: crossAxisAlignment)
        .createStyle(_div);
  }

  @override
  Element get getElement => _div;
}

class RImage extends Relement {
  String url;
  RStyle? style;
  RImage({this.url = "", this.style});

  var _image = Element.img();
  @override
  Element create() {
    _image.attributes.addAll({"src": url});
    if (style != null) {
      _image = style!.createStyle(_image);
    }
    return _image;
  }

  @override
  // TODO: implement getElement
  Element get getElement => _image;
}
