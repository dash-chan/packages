import 'package:flutter/material.dart';

import 'fab.dart';

class Devision {
  static late GlobalKey<NavigatorState> key;
  static NavigatorState get navigator => key.currentState!;
  static BuildContext get globalContext => key.currentContext!;
  static final cs = ColorScheme.fromSeed(seedColor: Colors.teal);
  static TransitionBuilder init(GlobalKey<NavigatorState> navigatorKey) {
    key = navigatorKey;
    return _init;
  }

  static Widget _init(BuildContext context, Widget? child) {
    return Stack(
      children: [
        child ?? const SizedBox.shrink(),
        const DevisionFab(),
      ],
    );
  }
}
