import 'package:flutter/material.dart';

class MessengerService {
  final MessengerService instance = MessengerService._();
  MessengerService._();
  Overlay? overlay;
  void show(context) {
    overlay = showOverlay(context);
  }

  void hide() {
    overlay = null;
  }

   showOverlay(BuildContext context) {
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
    return state;
  }
}
