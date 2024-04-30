import 'dart:ui';

import 'package:flutter/material.dart';

class OverlayController {
  final VoidCallback close;
  OverlayController(this.close);
}

class LoadingOverlay {
  LoadingOverlay._();
  static final instance = LoadingOverlay._();
  OverlayController? controller;

  void show(BuildContext context) {
    controller = showOverlay(context);
  }

  void hide() {
    if (controller != null) {
      controller!.close();
      controller = null;
    }
  }

  OverlayController showOverlay(BuildContext context) {
    final state = Overlay.of(context);
    final entry = OverlayEntry(builder: (context) {
      return Material(
        color: Theme.of(context).shadowColor.withOpacity(.50),
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            strokeWidth: 8.0,
            strokeCap: StrokeCap.round,
          ),
        ),
      );
    });

    state.insert(entry);
    return OverlayController(() {
      entry.remove();
    });
  }
}
