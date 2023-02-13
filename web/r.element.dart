import 'dart:html';

import 'base/edge.dart';

abstract class Relement {
  static int registrerElementID = 0;
  const Relement();
  Element create();
  Element get getElement;
}

//definition du type de
typedef RelementCallBack(Relement element);
