import 'dart:async';

import 'package:flutter/material.dart';

extension SafeSetStateExtension on State {

  FutureOr<void> safeRebuild(Function() fn) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fn();
    });
  }
}
