import 'dart:async';
import 'dart:math';
import 'base/border.dart';
import 'base/edge.dart';
import 'base/enum.dart';
import 'base/r.decoration.dart';
import 'bases.dart';
import 'r.app.dart';
import 'r.element.dart';
import 'rcolor.dart';
import 'rstyle.dart';

void main() {
  Rapplication(
      home: Page(
          appBarStyle: RStyle(
              decoration: Decoration(color: Colors.red),
              padding: REdgetInset.all(10)),
          backgroundColor: Colors.formRGB(228, 235, 240),
          appBar: Appbar(
              title: Text("TEst app", color: Colors.white, size: 28),
              heigth: 70,
              actions: [Ricons.CoeurSymbole.getIcon()],
              onPress: (element) {
                var _colors = [Colors.gray, Colors.blue, Colors.cyan];
                Timer.periodic(Duration(seconds: 1), (timer) {
                  element.getElement.style.backgroundColor =
                      _colors[Random().nextInt(_colors.length)];
                });
              }),
          body: Container(
              style: RStyle(
                expandHeight: true,
                expandWidth: true,
              ),
              child: Column(
                  crossAxisAlignment: AlignmentVertical.center,
                  mainAxisAlignment: AligmentHorizontal.spaceBetween,
                  children: [
                    Row(children: [mybox(), mybox(), mybox()]),
                    RImage(
                        style: RStyle(
                            height: 200,
                            width: 200,
                            decoration: Decoration(
                                shadow: BoxShadow(blur: 10),
                                border: Rborder(
                                  raduis: Raduis.all(20),
                                ))),
                        url:
                            "https://sb.kaleidousercontent.com/67418/992x558/ef4cc24685/people-org.png"),
                    Row(children: [mybox(), mybox(), mybox()])
                  ]))));
}

Relement mybox() {
  return Container(
      child: Text("Best"),
      style: RStyle(
          margin: REdgetInset.all(10),
          width: 50,
          height: 100,
          modeRatio: false,
          padding: REdgetInset(top: 10, left: 10),
          decoration: Decoration(
              color: Colors.red,
              shadow: BoxShadow(blur: 10, vertical: 2, horizontal: 1),
              border: Rborder(
                  raduis: Raduis(topLeft: 20, topRight: 20),
                  side: BorderSide(color: Colors.Black, side: 1)))));
}
